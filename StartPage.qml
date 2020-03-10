DPage {
    id: root
    backButtonRequired: false
    button: ButtonStart { onClicked: root.nextPageRequested() }
    contentIsText: qsTr("Tell us the features for your daily work you would\nand turn the answers in a Spotify playlist\ntailored for you!\n\nWe will share with you how we made this Qt demo!")
}
