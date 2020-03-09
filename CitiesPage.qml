import QtQuick 2.12

DPageSubTitled {
    id: root

    text: qsTr("Your ideal capital city you would live in?");
    readonly property bool selected: Boolean(city)
    property string city: ""

    function reset() { cityList.currentIndex = 0; city = ""; }

    ListView {
        id: cityList
        width: parent.width
        height: 240
        y: 100

        orientation: Qt.Horizontal
        highlightFollowsCurrentItem: true
        preferredHighlightBegin: 300
        preferredHighlightEnd: 500
        highlightRangeMode: ListView.StrictlyEnforceRange

        model: ListModel {
            id: citiesModel
            ListElement { city: "rome" }
            ListElement { city: "london" }
            ListElement { city: "sidney" }
            ListElement { city: "agra" }
            ListElement { city: "new-york" }
            ListElement { city: "paris" }
            ListElement { city: "beijing" }
            ListElement { city: "san-paolo" }
            ListElement { city: "barcellona" }
            ListElement { city: "moscow" }
        }
        delegate: CityDelegate {
            source: "assets/cities/ic_" + city + (ListView.isCurrentItem ? ".png" : "-disable.png")
            onClicked: {
                cityList.currentIndex = index;
                root.city = city;
            }
        }

        onVisibleChanged: { if (visible && !root.selected) currentIndex = 5; }
        onDragEnded: { root.city = citiesModel.get(currentIndex).city; }
    }

    DButton {
        y: 368
        anchors.horizontalCenter: parent.horizontalCenter
        enabled: root.selected
        source: enabled ? "assets/btn/btn_next-active.png" : "assets/btn/btn_next-disable.png"
        onClicked: root.nextPageRequested()
    }
}
