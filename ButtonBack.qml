import QtQuick 2.12

DButton {
    id: root

    property bool show: true

    opacity: 0.0
    enabled: show
    source: "assets/ic_back.png"
    transitions: Transition { OpacityAnimator { target: root; } }
    states: [
        State { when: !root.show; PropertyChanges { target: root; opacity: 0.0; } },
        State { when: root.show; PropertyChanges { target: root; opacity: 1.0; } }
    ]
}
