import QtQuick 2.12

DPage {
    id: root
    stepsBarRequired: true
    titleRequired: false

    property string role: ""
    property bool showList: false

    function reset() { role = ""; showList = false; }

    Column {
        y: 144
        anchors.horizontalCenter: parent.horizontalCenter
        DTextThin {
            id: field
            anchors.left: dropDownButton.left
            text: qsTr("ROLE")
            font.pixelSize: 16
        }
        MouseArea {
            id: dropDownButton
            width: 480
            height: 72
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: { root.showList = !root.showList; }

            DText {
                x: 16
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Select your role")
                color: Colors.white
            }
            Image {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                source: root.showList ? "assets/ic_drop-collapse.png" : "assets/ic_drop-show.png"
            }
            Rectangle {
                width: parent.width
                height: 1
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: Colors.lightgrey
            }
        }
        ListView {
            id: rolesList
            width: dropDownButton.width
            height: 256
            anchors.left: dropDownButton.left
            enabled: opacity === 1.0
            clip: true
            model: rolesModel
            delegate: DelegateRole {
                roleName: qsTr(model.role)
                selected: containsPress || root.role === model.role
                onClicked: {
                    root.nextPageRequested();
                    root.role = model.role;
                }
            }
            transitions: Transition { OpacityAnimator { target: rolesList; duration: 500; } }
            states: [
                State { when: !root.showList; PropertyChanges { target: rolesList; opacity: 0.0; } },
                State { when: root.showList; PropertyChanges { target: rolesList; opacity: 1.0; } }
            ]
        }
    }
    ListModel {
        id: rolesModel
        ListElement { role: QT_TR_NOOP("Project manager") }
        ListElement { role: QT_TR_NOOP("Developer") }
        ListElement { role: QT_TR_NOOP("Sales") }
    }
}
