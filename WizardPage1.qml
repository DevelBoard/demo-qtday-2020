import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    id: root

    signal nextPageRequested

    DTextThin {
        text: qsTr("QT MUSIC FOR YOUR DAILY PATHS")
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
    }

    DText {
        text: qsTr("exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat")
        width: 356
        height: 100
        anchors.top: parent.top
        anchors.topMargin: 163
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
