import QtQuick 2.12

MouseArea {
    id: root
    width: 200
    height: 240

    property alias source: cityImage.source

    Image {
        id: cityImage
        anchors.centerIn: parent
    }
}
