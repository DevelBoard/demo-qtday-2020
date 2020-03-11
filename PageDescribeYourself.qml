import QtQuick 2.12

DPage {
    id: root
    button: ButtonStart { onClicked: root.nextPageRequested() }
    textContent: qsTr("Cities, sports and urban activity!\nDescribe yourself and get your own Qt sound!")

    property alias textStep_1: step_1.text
    property alias textStep_2: step_2.text
    property alias textStep_3: step_3.text

    Row {
        height: 16
        y: 104
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 8
        DTextStep {
            id: step_1
            width: step_3.width
            maximumLineCount: 1
            elide: Text.ElideRight
            horizontalAlignment: Text.AlignRight
        }
        Rectangle {
            width: 32
            height: 1
            anchors.verticalCenter: parent.verticalCenter
            color: Colors.green
        }
        DTextStep {
            id: step_2
            maximumLineCount: 1
            elide: Text.ElideRight
        }
        Rectangle {
            width: 32
            height: 1
            anchors.verticalCenter: parent.verticalCenter
            color: Colors.green
        }
        DTextStep {
            id: step_3
            maximumLineCount: 1
            elide: Text.ElideRight
        }
    }
}
