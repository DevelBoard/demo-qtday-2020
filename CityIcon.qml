import QtQuick 2.12

Rectangle {
    id: root

    property string cityName: ""
    property string cityEnabled: ""
    property string cityDisabled: ""

    signal clicked

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }

    width: 200
    height: 240

    Rectangle {
        anchors.fill: parent
        anchors.topMargin: 20
        anchors.bottomMargin: 20
        anchors.leftMargin: 20
        anchors.rightMargin: 20

        border.width: 1
        border.color: "red"

        Image {
            anchors.top: parent.top
            anchors.topMargin: 10
            source: cityEnabled
        }
    }
}
