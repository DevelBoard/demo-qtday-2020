import QtQuick 2.12

AnimatedImage {
    id: root
    anchors.centerIn: parent
    source: "assets/loading.gif"
    paused: true

    readonly property int cyclesToPerform: 2
    readonly property int anticipateEndByNumFrames: 5
    readonly property int lastFrame: frameCount - 1
    readonly property int endFrame: lastFrame - anticipateEndByNumFrames
    property int cyclesPerformed: 0
    signal ended()

    onVisibleChanged: {
        if (!visible)
            return;
        currentFrame = 0;
        cyclesPerformed = 0;
        paused = false;
    }
    onFrameChanged: {
        if (currentFrame < endFrame)
            return;
        if (cyclesPerformed === cyclesToPerform - 1 && currentFrame === endFrame)
            root.ended();
        if (currentFrame === lastFrame)
            cyclesPerformed++;
        if (cyclesPerformed === cyclesToPerform)
            paused = true;
    }
}

