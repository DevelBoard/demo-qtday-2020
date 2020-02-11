import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 480
    title: qsTr("Demo QtDay 2020")

    Component {
        id: page1

        WizardPage1 {
            onNextPageRequested: stackView.push(page2)
        }
    }

    Component {
        id: page2

        WizardPage2 {}
    }

    StackView {
        id: stackView
        initialItem: page1
        anchors.fill: parent
    }
}
