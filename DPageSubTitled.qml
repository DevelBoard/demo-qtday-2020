DPage {
    property alias text: subtitle.text
    DText {
        id: subtitle
        font.pixelSize: 18
        anchors.top: parent.top
        anchors.topMargin: 60
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
