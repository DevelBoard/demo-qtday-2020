import QtQuick 2.12
import QtQuick.Controls 2.12

DPageSubTitled {
    id: root

    text: qsTr("Your ideal capital city you would live in?");

    ListView {
        id: cityList

        // anchors.centerIn: cityScrollView
        anchors.top: parent.top
        anchors.topMargin: 100
        anchors.left: parent.left
        anchors.right: parent.right
        height: 240

        orientation: Qt.Horizontal

        Component {
            id: highlightBar
            Rectangle {
                width: 200; height: 50
                color: "#FFFF88"
                y: listView.currentItem.y;
                Behavior on y { SpringAnimation { spring: 2; damping: 0.1 } }
            }
        }

        // highlight: highlightBar
        highlightFollowsCurrentItem: true
        preferredHighlightBegin: 300
        preferredHighlightEnd: 300
        highlightRangeMode: ListView.StrictlyEnforceRange

        Component.onCompleted: currentIndex = 5

        model: ListModel {
            ListElement {
                enabledImg: "assets/cities/ic_rome.png"
                disabledImg: "assets/cities/ic_rome-disable.png"
            }

            ListElement {
                enabledImg: "assets/cities/ic_london.png"
                disabledImg: "assets/cities/ic_london-disable.png"
            }

            ListElement {
                enabledImg: "assets/cities/ic_sidney.png"
                disabledImg: "assets/cities/ic_sidney-disable.png"
            }

            ListElement {
                enabledImg: "assets/cities/ic_agra.png"
                disabledImg: "assets/cities/ic_agra-disable.png"
            }

            ListElement {
                enabledImg: "assets/cities/ic_new-york.png"
                disabledImg: "assets/cities/ic_new-york-disable.png"
            }

            ListElement {
                enabledImg: "assets/cities/ic_paris.png"
                disabledImg: "assets/cities/ic_paris-disable.png"
            }

            ListElement {
                enabledImg: "assets/cities/ic_beijing.png"
                disabledImg: "assets/cities/ic_beijing-disable.png"
            }

            ListElement {
                enabledImg: "assets/cities/ic_san-paolo.png"
                disabledImg: "assets/cities/ic_san-paolo-disable.png"
            }

            ListElement {
                enabledImg: "assets/cities/ic_barcellona.png"
                disabledImg: "assets/cities/ic_barcellona-disable.png"
            }

            ListElement {
                enabledImg: "assets/cities/ic_moscow.png"
                disabledImg: "assets/cities/ic_moscow-disable.png"
            }
        }

        delegate: CityIcon {
            cityEnabled: enabledImg
            cityDisabled: disabledImg
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
