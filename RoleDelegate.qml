import QtQuick 2.12

MouseArea {
    id: root
    width: 480
    height: 72

    property alias roleName: textField.text
    property bool selected: false
    readonly property string currentColor: selected ? "#77FF9C" : "#D6E2F0"

    Rectangle {
        width: parent.width
        height: 56
        y: 8
        color: root.selected ? "transparent" : "#2E4254"

        DText {
            id: textField
            x: 20
            anchors.verticalCenter: parent.verticalCenter
            color: root.currentColor
        }
    }
    Rectangle {
        color: root.currentColor
        width: parent.width
        height: 1
        y: 72
    }
}
