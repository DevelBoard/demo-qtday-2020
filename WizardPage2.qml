import QtQuick 2.12
import QtQuick.Controls 2.12

DPageSubTitled {
    id: root

    text: qsTr("Your ideal capital city you would live in?");

    ListView {
        id: cityList

        anchors.top: parent.top
        anchors.topMargin: 100
        anchors.left: parent.left
        anchors.right: parent.right

        orientation: Qt.Horizontal

        highlightFollowsCurrentItem: true
        preferredHighlightBegin: 300
        preferredHighlightEnd: 300
        highlightRangeMode: ListView.StrictlyEnforceRange

        Component.onCompleted: currentIndex = 5

        model: ListModel {
            ListElement { baseSource: "assets/cities/ic_rome" }
            ListElement { baseSource: "assets/cities/ic_london" }
            ListElement { baseSource: "assets/cities/ic_sidney" }
            ListElement { baseSource: "assets/cities/ic_agra" }
            ListElement { baseSource: "assets/cities/ic_new-york" }
            ListElement { baseSource: "assets/cities/ic_paris" }
            ListElement { baseSource: "assets/cities/ic_beijing" }
            ListElement { baseSource: "assets/cities/ic_san-paolo" }
            ListElement { baseSource: "assets/cities/ic_barcellona" }
            ListElement { baseSource: "assets/cities/ic_moscow" }
        }

        delegate: CityIcon {
            source: baseSource + (ListView.isCurrentItem ? ".png" : "-disable.png")
            onClicked: cityList.currentIndex = index
        }
    }

    DButton {
        anchors.top: parent.top
        anchors.topMargin: 360
        anchors.horizontalCenter: parent.horizontalCenter
        source: "assets/btn/btn_start-active.png"
        onClicked: root.nextPageRequested()
    }
}
