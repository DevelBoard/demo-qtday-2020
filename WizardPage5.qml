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
        text: qsTr("Mix the subjects of your standard work day!")
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
        source: "assets/btn/btn_start-active.png"
        onClicked: root.nextPageRequested()
    }
}
