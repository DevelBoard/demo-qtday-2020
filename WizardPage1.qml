import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    id: root

    signal nextPageRequested

    DTextThin {
        text: "QT MUSIC FOR YOUR DAILY PATHS"
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
    }

    DText {
        text: "Cities, sports and urban activity!"
        width: 356
        height: 100
        anchors.top: parent.top
        anchors.topMargin: 133
        anchors.horizontalCenter: parent.horizontalCenter
    }

    DText {
        text: "Describe yourself and get your own Qt sound!"
        width: 500
        height: 100
        anchors.top: parent.top
        anchors.topMargin: 193
        anchors.horizontalCenter: parent.horizontalCenter
    }

    DButton {
        anchors.top: parent.top
        anchors.topMargin: 360
        anchors.horizontalCenter: parent.horizontalCenter
        source: "assets/start-button.png"

        onClicked: root.nextPageRequested()
    }
}
