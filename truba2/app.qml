Activity {
	id: mainWindow;
	property bool portraitOrientation: false;
	anchors.fill: renderer;
	name: "root";

	Protocol		{ id: protocol; enabled: true; }

	ColorTheme		{ id: colorTheme; }

	LocalStorage {
		id: lastChannel;
		property string source;
		name: "lastChannel";

		onCompleted: {
			this.read();
			var channelInfo = lastChannel.value ? JSON.parse(lastChannel.value): {};
			if (channelInfo)
				mainWindow.switchToChannel(channelInfo);
		}
	}

	ProvidersModel {
		id: providersModel;
		protocol: protocol;
	}

	CategoriesModel	{
		id: categoriesModel;
		protocol: protocol;
		providers: providersModel.providers;
	}

	EPGModel {
		id: epgModel;
		protocol: protocol;
	}

	Timer {
		id: updateTimer;
		interval: 24 * 3600 * 1000;
		repeat: true;

		onTriggered: {
			categoriesModel.update();
			epgModel.update();
		}
	}

	VideoPlayer {
		id: videoPlayer;
		anchors.top: mainWindow.top;
		anchors.right: mainWindow.right;
		width: renderer.width;
		height: renderer.height;
		source: lastChannel.source ? lastChannel.source : "http://hlsstr04.svc.iptv.rt.ru/hls/CH_NICKELODEON/variant.m3u8?version=2";
		autoPlay: true;

		onHeightChanged: { mainWindow.updateLayout(); }
	}

	updateLayout: {
		if (renderer.width < renderer.height) {
			log("Layout: w:" + renderer.width + "x" + renderer.height + ". Use portrait orientation.");
			this.portraitOrientation = true;
		} else {
			log("Layout: w:" + renderer.width + "x" + renderer.height + ". Use usual orientation.");
			this.portraitOrientation = false;
		}
	}

	onCompleted: { this.updateLayout(); }
}
