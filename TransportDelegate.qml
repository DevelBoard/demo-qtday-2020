import QtQuick 2.12

MouseArea {
    id: root
    width: 256
    height: transportName.font.pixelSize * 2.6

    property bool selected: false
    property alias text: transportName.text

    DText {
        id: transportName
        anchors.verticalCenter: parent.verticalCenter
        color: root.selected ? "#77FF9C" : "#596D80"
        font.letterSpacing: 3 + 2 * selected
        font.pixelSize: root.selected ? 36 : 18
        font.capitalization: Font.AllUppercase
    }
}
