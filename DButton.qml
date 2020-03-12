import QtQuick 2.12

MouseArea {
    id: root
    width: image.width
    height: image.height
    property alias source: image.source

    DImage {
        id: image
    }
}
