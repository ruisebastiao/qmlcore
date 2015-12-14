Item {
	id: categoryDelegate;
	property string genre: model.text;
	width: parent.width;
	height: 50;
	clip: true;

	Rectangle {
		anchors.fill: parent;
		color: colorTheme.activeFocusColor;
		visible: parent.activeFocus;
	}

	Text {
		anchors.left: parent.left;
		anchors.leftMargin: 10;
		anchors.verticalCenter: parent.verticalCenter;
		text: categoryDelegate.genre;
		color: categoryDelegate.activeFocus ? colorTheme.focusedTextColor : colorTheme.activeTextColor;
		font.pixelSize: 28;
		opacity: parent.activeFocus ? 1 : 0.8;
	}
}
