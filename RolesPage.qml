import QtQuick 2.12

DPageStep {
    id: root
    step: 1
    textField: qsTr("ROLE")

    property string selection: ""
    property bool showList: false

    function reset() { selection = ""; showList = false; }

    MouseArea {
        id: dropDownButton
        width: 480
        height: 72
        y: 152
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: { root.showList = !root.showList; }

        DText {
            x: 16
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("select your role")
            color: "#2E4254"
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
            color: "#92A6BF"
        }
    }
    Column {
        id: rolesList
        anchors.top: dropDownButton.bottom
        anchors.left: dropDownButton.left
        opacity: 0
        enabled: opacity === 1.0

        states: State { when: root.showList; PropertyChanges { target: rolesList; opacity: 1.0; } }
        transitions: Transition { NumberAnimation { properties: "opacity"; } }

        RoleDelegate { roleName: qsTr("Project manager"); selected: root.selection === roleName; onPressed: { root.selection = roleName; } onReleased: root.nextPageRequested() }
        RoleDelegate { roleName: qsTr("Developer"); selected: root.selection === roleName; onPressed: { root.selection = roleName; } onReleased: root.nextPageRequested() }
        RoleDelegate { roleName: qsTr("Sales"); selected: root.selection === roleName; onPressed: { root.selection = roleName; } onReleased: root.nextPageRequested() }
    }
}
