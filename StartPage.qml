DPageTitled {
    id: root
    titleVerticalOffset: 8

    DText {
        text: qsTr("Tell us the features for your daily work you would\nand turn the answers in a Spotify playlist\ntailored for you!\n\nWe will share with you how we made this Qt demo!")
        lineHeight: 1.25
        anchors.top: parent.top
        anchors.topMargin: 124
        anchors.horizontalCenter: parent.horizontalCenter
    }
    DButton {
        source: "assets/btn/btn_start-active.png"
        anchors.top: parent.top
        anchors.topMargin: 368
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: root.nextPageRequested()
    }
}
