DPage {
    id: root

    DImageLoading {
        anchors.centerIn: parent
        onEnded: root.nextPageRequested()
    }
}
