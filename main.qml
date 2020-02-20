import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 480
    title: qsTr("Demo QtDay 2020")

    FontLoader {
        id: mediumFont
        source: "assets/fonts/medium.otf"
    }

    FontLoader {
        id: thinFont
        source: "assets/fonts/thin.otf"
    }

    Component {
        id: page1
        WizardPage1 {
            onNextPageRequested: stackView.push(page2)
        }
    }

    Component {
        id: page2
        WizardPage2 {
            onNextPageRequested: stackView.push(page3)
        }
    }

    Component {
        id: page3
        WizardPage3 {
            onNextPageRequested: stackView.push(page4)
        }
    }

    Component {
        id: page4
        WizardPage4 {}
    }

    StackView {
        id: stackView
        initialItem: page1
        anchors.fill: parent
    }
}
