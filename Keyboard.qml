import QtQuick 2.12
import QtQuick.VirtualKeyboard 2.4

InputPanel {
    id: root

    property bool show: false

    opacity: 0.0
    enabled: show
    externalLanguageSwitchEnabled: false
    transitions: Transition { OpacityAnimator { target: root; } }
    states: [
        State { when: !root.show; PropertyChanges { target: root; opacity: 0.0; } },
        State { when: root.show; PropertyChanges { target: root; opacity: 1.0; } }
    ]

    Rectangle {
        width: 102
        height: 47
        radius: 5
        y: 63
        anchors.right: parent.right
        anchors.rightMargin: 40
        color: Colors.green
        Text {
            anchors.centerIn: parent
            text: "ENTER"
            color: Colors.blue
            font.pixelSize: 18
        }
    }
}
