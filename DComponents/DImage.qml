import QtQuick 2.12

Image {
    id: root

    Image {
        id: image
        onOpacityChanged: { if (!opacity) source = root.source; }

        states: [
            State { when: root.source === image.source; PropertyChanges { target: image; opacity: 1.0; } },
            State { when: root.source !== image.source; PropertyChanges { target: image; opacity: 0.0; } }
        ]
        transitions: Transition { OpacityAnimator { target: root; duration: 200; easing.type: Easing.InQuad } }
    }
}
