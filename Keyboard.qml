import QtQuick 2.12
import QtQuick.VirtualKeyboard 2.4

InputPanel {
    active: false
    externalLanguageSwitchEnabled: false

    Rectangle {
        width: 102
        height: 47
        radius: 5
        y: 63
        anchors.right: parent.right
        anchors.rightMargin: 40
        color: Colors.green
    }
}
