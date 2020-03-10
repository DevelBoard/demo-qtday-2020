import QtQuick 2.12

DTextThin {
    id: root

    property bool show: true

    text: qsTr("QT MUSIC FOR YOUR DAILY PATHS")
    font.pixelSize: 14
    color: Colors.green
    font.letterSpacing: 5.4
    transitions: Transition { OpacityAnimator { target: root; } }
    states: [
        State { when: !root.show; PropertyChanges { target: root; opacity: 0.0; } },
        State { when: root.show; PropertyChanges { target: root; opacity: 1.0; } }
    ]
}
