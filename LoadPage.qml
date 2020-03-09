import QtQuick 2.12

DPage {
    id: root

    onVisibleChanged: { if (visible) triggerNextPageTimer.start(); }

    AnimatedImage {
        width: 300
        height: 200
        anchors.centerIn: parent
        source: "assets/loading.gif"
    }

    Timer {
        id: triggerNextPageTimer
        interval: 2000
        onTriggered: root.nextPageRequested()
    }
}
