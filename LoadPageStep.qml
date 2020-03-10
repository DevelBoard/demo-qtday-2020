import QtQuick 2.12

DPageStep {
    id: root
    step: 4

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
