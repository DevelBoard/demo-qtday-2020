import QtQuick 2.12

DPage {
    id: root
    property int titleVerticalOffset: 0
    DTextThin {
        text: qsTr("QT MUSIC FOR YOUR DAILY PATHS")
        color: "#77FF9C"
        font.letterSpacing: 5.4
        anchors.top: parent.top
        anchors.topMargin: 20 + root.titleVerticalOffset
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
