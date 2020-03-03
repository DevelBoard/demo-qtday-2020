import QtQuick 2.12
import QtQuick.Controls 2.12

DPage {
    id: root

    DTextThin {
        text: qsTr("QT MUSIC FOR YOUR DAILY PATHS")
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
    }

    DText {
        text: qsTr("Check out your mail box")
        width: 500
        height: 100
        anchors.top: parent.top
        anchors.topMargin: 133
        anchors.horizontalCenter: parent.horizontalCenter
    }

    DText {
        text: qsTr("and get your own Qt playlist in Spotify!")
        width: 500
        height: 100
        anchors.top: parent.top
        anchors.topMargin: 163
        anchors.horizontalCenter: parent.horizontalCenter
    }

    DButton {
        anchors.top: parent.top
        anchors.topMargin: 360
        anchors.horizontalCenter: parent.horizontalCenter
        source: "assets/btn/btn_start-active.png"
        onClicked: root.nextPageRequested()
    }
}
