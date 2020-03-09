DPage {
    id: root

    DText {
        text: "Cities, sports and urban activity!\nDescribe yourself and get your own Qt sound!"
        lineHeight: 2.2
        anchors.top: parent.top
        anchors.topMargin: 148
        anchors.horizontalCenter: parent.horizontalCenter
    }
    DButton {
        y: 368
        anchors.horizontalCenter: parent.horizontalCenter
        source: pressed ? "assets/btn/btn_start-pressed.png" : "assets/btn/btn_start-active.png"
        onClicked: root.nextPageRequested()
    }
}
