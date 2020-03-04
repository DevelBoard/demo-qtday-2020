import QtQuick 2.12

DPageSubTitled {
    id: root

    text: qsTr("Your ideal capital city you would live in?");
    property bool selected: false

    ListView {
        id: cityList
        width: parent.width
        y: 100

        orientation: Qt.Horizontal
        highlightFollowsCurrentItem: true
        preferredHighlightBegin: 300
        preferredHighlightEnd: 500
        highlightRangeMode: ListView.StrictlyEnforceRange

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
        delegate: CityDelegate {
            source: baseSource + (ListView.isCurrentItem ? ".png" : "-disable.png")
            onClicked: {
                cityList.currentIndex = index;
                selected = true;
            }
        }

        Component.onCompleted: { currentIndex = 5; }
        onVisibleChanged: { if (!root.selected) currentIndex = 5; }
    }

    DButton {
        y: 368
        anchors.horizontalCenter: parent.horizontalCenter
        enabled: root.selected
        source: enabled ? "assets/btn/btn_next-active.png" : "assets/btn/btn_next-disable.png"
        onClicked: root.nextPageRequested()
    }
}
