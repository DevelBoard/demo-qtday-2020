DPage {
    id: root
    backButtonRequired: false
    button: ButtonStart { onClicked: root.nextPageRequested() }
    textContent: qsTr("Get your own Spotify playlist!\n\nTurn your daily activities into your favorite music!")
}
