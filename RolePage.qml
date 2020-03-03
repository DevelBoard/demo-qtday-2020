import QtQuick 2.12

DPageStep {
    id: root
    step: 1
    textField: qsTr("ROLE")

    property string selection: ""
    property bool showList: false
    onShowListChanged: showList ? fadeIn.start() : fadeOut.start()

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
        RoleDelegate { roleName: qsTr("Project manager"); selected: root.selection === roleName; onPressed: { root.selection = roleName; } onReleased: root.nextPageRequested() }
        RoleDelegate { roleName: qsTr("Developer"); selected: root.selection === roleName; onPressed: { root.selection = roleName; } onReleased: root.nextPageRequested() }
        RoleDelegate { roleName: qsTr("Sales"); selected: root.selection === roleName; onPressed: { root.selection = roleName; } onReleased: root.nextPageRequested() }
        NumberAnimation on opacity {
            id: fadeOut
            from: 1; to: 0; duration: 250
        }
        NumberAnimation on opacity {
            id: fadeIn
            from: 0; to: 1; duration: 250
        }
    }
}
