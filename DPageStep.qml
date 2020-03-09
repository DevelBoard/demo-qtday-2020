import QtQuick 2.12

DPage {
    id: root
    titleRequired: false

    property int step: 0
    property alias textField: field.text
    property alias textStep_1: step_1.text
    property alias textStep_2: step_2.text
    property alias textStep_3: step_3.text

    DTextThin {
        id: field
        x: 160
        y: 128
    }

    Row {
        id: stepsRow
        spacing: 8
        anchors.top: parent.top
        anchors.topMargin: 24
        anchors.horizontalCenter: parent.horizontalCenter

        Image {
            source: {
                switch (root.step)
                {
                default:
                    return "assets/ic_step-1-active.png";
                case 1:
                    return "assets/ic_step-1-ongoing.png";
                case 2:
                case 3:
                case 4:
                    return "assets/ic_timeline_tick.png";
                }
            }
            DText {
                id: step_1
                anchors.top: parent.bottom
                anchors.topMargin: 8
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#77FF9C"
                font.pixelSize: 10
                font.letterSpacing: 1.2
                font.capitalization: Font.AllUppercase
            }
        }
        DLine {
            width: 160
            anchors.verticalCenter: parent.verticalCenter
            fill: Math.min(root.step, DLine.Full)
        }
        Image {
            source: {
                switch (root.step)
                {
                default:
                case 1:
                    return "assets/ic_step-2-active.png";
                case 2:
                    return "assets/ic_step-2-ongoing.png";
                case 3:
                case 4:
                    return "assets/ic_timeline_tick.png";
                }
            }
            DText {
                id: step_2
                anchors.top: parent.bottom
                anchors.topMargin: 8
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#77FF9C"
                font.pixelSize: 10
                font.letterSpacing: 1.2
                font.capitalization: Font.AllUppercase
            }
        }
        DLine {
            width: 160
            anchors.verticalCenter: parent.verticalCenter
            fill: Math.min(root.step - 1, DLine.Full)
        }
        Image {
            source: {
                switch (root.step)
                {
                default:
                case 1:
                case 2:
                    return "assets/ic_step-3-active.png";
                case 3:
                    return "assets/ic_step-3-ongoing.png";
                case 4:
                    return "assets/ic_timeline_tick.png";
                }
            }
            DText {
                id: step_3
                anchors.top: parent.bottom
                anchors.topMargin: 8
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#77FF9C"
                font.pixelSize: 10
                font.letterSpacing: 1.2
                font.capitalization: Font.AllUppercase
            }
        }
    }
}
