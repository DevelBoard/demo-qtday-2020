import QtQuick 2.12
import QtQuick.Controls 2.12

DPage {
    id:root
    stepsBarRequired: true
    titleRequired: false
    keyboardRequired: true

    property alias name: nameTextField.text

    function reset() { name = ""; }

    Column {
        y: 144
        anchors.horizontalCenter: parent.horizontalCenter
        DTextThin {
            id: field
            anchors.left: nameTextField.left
            text: qsTr("NAME")
            font.pixelSize: 16
        }
        DTextField {
            id: nameTextField
            width: 480
            height: 72
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr(" your name...")
            onVisibleChanged: { if (visible) forceActiveFocus(); }
            onAccepted: { if (text) root.nextPageRequested(); }
        }
    }
}
