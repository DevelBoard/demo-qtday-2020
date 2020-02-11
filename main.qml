import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 480
    title: qsTr("Demo QtDay 2020")

    StackView {
        id: stackView
        anchors.fill: parent
    }
}
