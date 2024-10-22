import QtQuick 2.12
import QtQuick.Controls 2.12

TextField {
    id: root
    font.pixelSize: 24
    font.letterSpacing: 1.2
    font.family: mediumFont.name
    wrapMode: Text.Wrap
    color: colorOverride ? colorOverride : Colors.green
    placeholderTextColor: Colors.lightblue
    leftPadding: 20
    background: null

    property string colorOverride: ""

    DLine {
        width: parent.width
        anchors.bottom: parent.bottom
        colorOverride: root.colorOverride
        fill: root.text ? DLine.Full : parent.activeFocus
    }
}
