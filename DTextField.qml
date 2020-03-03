import QtQuick 2.12
import QtQuick.Controls 2.12

TextField {
    id: root
    font.pixelSize: 24
    font.letterSpacing: 1.2
    font.family: mediumFont.name
    wrapMode: Text.Wrap
    color: "#77FF9C"
    placeholderTextColor: "#D6E2F0"
    leftPadding: 20
    background: null

    DLine {
        width: parent.width
        anchors.bottom: parent.bottom
        fill: root.text ? DLine.Full : parent.activeFocus
    }
}
