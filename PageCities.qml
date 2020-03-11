import QtQuick 2.12

DPage {
    id: root

    subtitle: qsTr("Your ideal capital city you would live in?");
    button: ButtonNext { id: next; enabled: Boolean(city); onClicked: root.nextPageRequested(); }

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
        delegate: DelegateCity {
            source: "assets/cities/ic_" + city + (ListView.isCurrentItem ? ".png" : "-disable.png")
            onClicked: {
                cityList.currentIndex = index;
                root.city = city;
            }
        }

        onVisibleChanged: { if (visible && !root.selected) currentIndex = 5; }
        onDragEnded: { root.city = citiesModel.get(currentIndex).city; }
    }
}
