import QtQuick 2.12

MouseArea {
    id: root
    width: 480
    height: 72

    property alias roleName: textField.text
    property bool selected: false
    readonly property string currentColor: selected ? Colors.green : Colors.white

    Rectangle {
        width: parent.width
        height: 56
        y: 8
        color: root.selected ? "transparent" : Colors.lightblue

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
