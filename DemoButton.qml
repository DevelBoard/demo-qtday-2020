import QtQuick 2.12

Rectangle {
    id: root

    property alias text: caption.text
    signal clicked

    radius: 10
    color: "#C6C6C6"


    Text {
        id: caption
        font.pixelSize: 34
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
