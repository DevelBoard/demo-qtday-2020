import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    id: root

    signal nextPageRequested


    DTextThin {
        text: qsTr("QT MUSIC FOR YOUR DAILY PATHS")
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
    }

    DText {
        text: qsTr("Your ideal capital city you would live in?")
        width: 500
        height: 40
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
    }

    ScrollView {
        id: cityScrollView

        anchors.top: parent.top
        anchors.topMargin: 100
        anchors.left: parent.left
        anchors.right: parent.right
        height: 240

        contentWidth: 180 * 4

        ListView {
            anchors.centerIn: cityScrollView

            orientation: Qt.Horizontal


            model: ListModel {

                ListElement {
                    name: "New York"
                    enabledImg: "assets/cities/ic_agra.png"
                    disabledImg: "assets/cities/ic_agra-disable.png"
                }

                ListElement {
                    name: "Agra"
                    enabledImg: "assets/cities/ic_agra.png"
                    disabledImg: "assets/cities/ic_agra-disable.png"
                }

                ListElement {
                    name: "Sidney"
                    enabledImg: "assets/cities/ic_agra.png"
                    disabledImg: "assets/cities/ic_agra-disable.png"
                }

                ListElement {
                    name: "Paris"
                    enabledImg: "assets/cities/ic_agra.png"
                    disabledImg: "assets/cities/ic_agra-disable.png"
                }

                ListElement {
                    name: "Beijing"
                    enabledImg: "assets/cities/ic_agra.png"
                    disabledImg: "assets/cities/ic_agra-disable.png"
                }
            }

            delegate: CityIcon {
                cityName: name
                cityEnabled: enabledImg
                cityDisabled: disabledImg
            }
        }
    }

    DButton {
        anchors.top: parent.top
        anchors.topMargin: 360
        anchors.horizontalCenter: parent.horizontalCenter
        source: "assets/start-button.png"
        onClicked: root.nextPageRequested()
    }
}
