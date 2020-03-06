import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.VirtualKeyboard 2.4

DPageStep {
    id:root
    step: 2
    textField: qsTr("NAME")

    property alias name: nameTextField.text

    onVisibleChanged: { if (!visible) nameTextField.focus = false; }

    DTextField {
        id: nameTextField
        width: 480
        height: 72
        y: 152
        anchors.horizontalCenter: parent.horizontalCenter
        placeholderText: qsTr("your name...")
        onAccepted: { if (text) root.nextPageRequested(); }
    }
    InputPanel {
        width: parent.width
        enabled: nameTextField.focus
        anchors.bottomMargin: -28
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        externalLanguageSwitchEnabled: false
    }
}
