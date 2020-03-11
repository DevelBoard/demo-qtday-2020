import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    id: root
    background: null

    property bool backButtonRequired: true
    property bool keyboardRequired: false
    property bool titleRequired: true
    property alias textContent: textContent.text
    property alias subtitle: subtitle.text
    property alias button: buttonLoader.sourceComponent
    signal nextPageRequested()
    signal popupRequested()

    MouseArea {
        id: popupMouseArea
        anchors.fill: parent
        onPressAndHold: root.popupRequested()
        pressAndHoldInterval: 2000
    }
    DTextThin {
        id: subtitle
        font.pixelSize: 18
        anchors.top: parent.top
        anchors.topMargin: 78
        anchors.horizontalCenter: parent.horizontalCenter
    }
    DTextThin {
        id: textContent
        width: 560
        anchors.top: subtitle.bottom
        anchors.bottom: buttonLoader.top
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        lineHeight: 1.25
    }
    Loader {
        id: buttonLoader
        y: 384
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
