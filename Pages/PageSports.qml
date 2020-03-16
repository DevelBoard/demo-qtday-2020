import QtQuick 2.12
import QtQuick.Controls 2.12

DPage {
    id: root
    subtitle: qsTr("What do you do in your spare time?")
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
            DelegateSport { id: bycicle; baseSource: "assets/sports/ic_bycicle"; }
            DelegateSport { id: crossfit; baseSource: "assets/sports/ic_crossfit"; }
            DelegateSport { id: gym; baseSource: "assets/sports/ic_gym"; }
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 8
            DelegateSport { id: running; baseSource: "assets/sports/ic_running"; }
            DelegateSport { id: soccer; baseSource: "assets/sports/ic_soccer"; }
            DelegateSport { id: surf; baseSource: "assets/sports/ic_surf"; }
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 8
            DelegateSport { id: swimming; baseSource: "assets/sports/ic_swimming"; }
            DelegateSport { id: tennis; baseSource: "assets/sports/ic_tennis"; }
        }
    }
}
