import QtQuick 2.12
import QtQuick.Controls 2.12

DPage {
    id: root
    subtitle: qsTr("What do you do in your free time?")
    button: ButtonNext { id: next; enabled: root.selected; onClicked: root.nextPageRequested(); }

    property alias bycicleSelected: bycicle.selected
    property alias crossfitSelected: crossfit.selected
    property alias gymSelected: gym.selected
    property alias runningSelected: running.selected
    property alias soccerSelected: soccer.selected
    property alias surfSelected: surf.selected
    property alias swimmingSelected: swimming.selected
    property alias tennisSelected: tennis.selected
    readonly property bool selected: bycicleSelected  || crossfitSelected || gymSelected  ||
                                     runningSelected  || soccerSelected   || surfSelected ||
                                                swimmingSelected || tennisSelected

    function reset() {
        bycicleSelected = false;
        crossfitSelected = false;
        gymSelected = false;
        runningSelected = false;
        soccerSelected = false;
        surfSelected = false;
        swimmingSelected = false;
        tennisSelected = false;
    }

    Column {
        y: 140
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 16
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 8
            SportDelegate { id: bycicle; baseSource: "assets/sports/ic_bycicle"; }
            SportDelegate { id: crossfit; baseSource: "assets/sports/ic_crossfit"; }
            SportDelegate { id: gym; baseSource: "assets/sports/ic_gym"; }
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 8
            SportDelegate { id: running; baseSource: "assets/sports/ic_running"; }
            SportDelegate { id: soccer; baseSource: "assets/sports/ic_soccer"; }
            SportDelegate { id: surf; baseSource: "assets/sports/ic_surf"; }
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 8
            SportDelegate { id: swimming; baseSource: "assets/sports/ic_swimming"; }
            SportDelegate { id: tennis; baseSource: "assets/sports/ic_tennis"; }
        }
    }
}
