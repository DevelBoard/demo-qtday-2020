DPageTitled {
    id: root

    DText {
        text: "Cities, sports and urban activity!\nDescribe yourself and get your own Qt sound!"
        lineHeight: 2.2
        anchors.top: parent.top
        anchors.topMargin: 148
        anchors.horizontalCenter: parent.horizontalCenter
    }
    DButton {
        source: "assets/btn/btn_start-active.png"
        y: 368
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: root.nextPageRequested()
    }
}
