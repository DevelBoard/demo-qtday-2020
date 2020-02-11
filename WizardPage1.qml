import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    id: root

    signal nextPageRequested

    Text {
        font.pixelSize: 16
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("QT MUSIC FOR YOUR DAILY PATHS")
    }

    Text {
        width: 400
        height: 100
        font.pixelSize: 24
        horizontalAlignment: Qt.AlignHCenter
        wrapMode: Text.Wrap
        anchors.top: parent.top
        anchors.topMargin: 163
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat")
    }

    DemoButton {
        anchors.top: parent.top
        anchors.topMargin: 360
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("START")
        width: 290
        height: 50

        onClicked: root.nextPageRequested()
    }
}
