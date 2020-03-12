import QtQuick 2.12
import QtQuick.Controls 2.12

Drawer {
    id: root

    background: Rectangle { color: Colors.blue }
    dim: false
    dragMargin: 16
    edge: Qt.TopEdge
    exit: Transition { NumberAnimation { property: "position"; to: 0.0; duration: 1000; easing.type: Easing.InQuad } }
    DTextStep {
        id: eeText
        anchors.centerIn: parent
        color: Colors.green
        text: "\"This is not an easter egg!\""
        font.pixelSize: 34
    }
    DTextStep {
        anchors.left: eeText.left
        anchors.top: eeText.bottom
        color: Colors.green
        text: "<Definitely not the developer>"
    }
    Timer {
        id: closingTimer
        property bool condition: root.position === 1.0
        onConditionChanged: condition ? restart() : stop()
        interval: 3000
        onTriggered: root.close();
    }
}
