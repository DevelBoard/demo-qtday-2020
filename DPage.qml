import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    id: root
    background: null

    property bool backButtonRequired: true
    property bool keyboardRequired: false
    property bool titleRequired: true
    signal nextPageRequested()
    signal resetPopupRequested()

    MouseArea {
        anchors.fill: parent
        onPressAndHold: root.resetPopupRequested()
        pressAndHoldInterval: 2000
    }
}
