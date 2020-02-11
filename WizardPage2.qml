import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    id: root

    signal nextPageRequested

    DemoButton {
        anchors.top: parent.top
        anchors.topMargin: 360
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("NEXT")
        width: 290
        height: 50

        onClicked: root.nextPageRequested()
    }
}
