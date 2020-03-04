import QtQuick 2.12
import QtQuick.Controls 2.12

DPageSubTitled {
    id: root
    text: qsTr("What do you do in your free time?")

    property bool selected: false
    property alias bycicleSelected: bycicle.selected
    property alias crossfitSelected: crossfit.selected
    property alias gymSelected: gym.selected
    property alias runningSelected: running.selected
    property alias soccerSelected: soccer.selected
    property alias surfSelected: surf.selected
    property alias swimmingSelected: swimming.selected
    property alias tennisSelected: tennis.selected

    Column {
        y: 140
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 16
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 8
            SportDelegate { id: bycicle; baseSource: "assets/sports/ic_bycicle"; onClicked: { root.selected = true; } }
            SportDelegate { id: crossfit; baseSource: "assets/sports/ic_crossfit"; onClicked: { root.selected = true; } }
            SportDelegate { id: gym; baseSource: "assets/sports/ic_gym"; onClicked: { root.selected = true; } }
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 8
            SportDelegate { id: running; baseSource: "assets/sports/ic_running"; onClicked: { root.selected = true; } }
            SportDelegate { id: soccer; baseSource: "assets/sports/ic_soccer"; onClicked: { root.selected = true; } }
            SportDelegate { id: surf; baseSource: "assets/sports/ic_surf"; onClicked: { root.selected = true; } }
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 8
            SportDelegate { id: swimming; baseSource: "assets/sports/ic_swimming"; onClicked: { root.selected = true; } }
            SportDelegate { id: tennis; baseSource: "assets/sports/ic_tennis"; onClicked: { root.selected = true; } }
        }
    }

    DButton {
        y: 368
        anchors.horizontalCenter: parent.horizontalCenter
        enabled: root.selected
        source: enabled ? "assets/btn/btn_next-active.png" : "assets/btn/btn_next-disable.png"
        onClicked: root.nextPageRequested()
    }
}
