import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 480
    title: qsTr("Demo QtDay 2020")
    background: Image { source: "assets/develboard_bg-1.png" }

    FontLoader {
        id: mediumFont
        source: "assets/fonts/medium.otf"
    }

    FontLoader {
        id: thinFont
        source: "assets/fonts/thin.otf"
    }

    Component {
        id: startPage
        StartPage { onNextPageRequested: stackView.push(page1) }
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
        WizardPage4 {
            onNextPageRequested: stackView.push(page5)
        }
    }

    Component {
        id: page5
        WizardPage5 {
            onNextPageRequested: stackView.push(page6)
        }
    }

    Component {
        id: page6
        WizardPage6 {
            onNextPageRequested: stackView.pop(null)
        }
    }

    StackView {
        id: stackView
        initialItem: startPage
        anchors.fill: parent
    }
}
