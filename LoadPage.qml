import QtQuick 2.12

DPage {
    id: root

    onVisibleChanged: { if (visible) triggerNextPageTimer.start(); }

    AnimatedImage {
        anchors.centerIn: parent
        source: "assets/loading.gif"
    }

    Timer {
        id: triggerNextPageTimer
        interval: 2000
        onTriggered: root.nextPageRequested()
    }
}
