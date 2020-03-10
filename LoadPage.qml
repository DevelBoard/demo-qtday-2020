DPage {
    id: root

    LoadingImage {
        anchors.centerIn: parent
        onEnded: root.nextPageRequested()
    }
}
