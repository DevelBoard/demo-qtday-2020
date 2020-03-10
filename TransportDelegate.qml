import QtQuick 2.12

MouseArea {
    id: root
    width: 256
    height: selected ? 68 : 50.5

    property bool selected: false
    property alias text: transportName.text

    DText {
        id: transportName
        x: 100 + 20 * selected
        anchors.verticalCenter: parent.verticalCenter
        color: root.selected ? Colors.green : Colors.grey
        font.letterSpacing: 3 + 2 * selected
        font.pixelSize: root.selected ? 32 : 18
        font.capitalization: Font.AllUppercase
    }
}
