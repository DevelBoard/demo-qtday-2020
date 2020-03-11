import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

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

    StackLayout {
        id: layout
        currentIndex: 0
        anchors.fill: parent
        enabled: opacity === 1.0
        opacity: 1.0
        onOpacityChanged: { if(!opacity) currentIndex = nextIndex; }

        readonly property DPage currentPage: children[layout.currentIndex]
        property int nextIndex: 0

        function reset() {
            layout.nextIndex = 0;
            pageRoles.reset();
            pageName.reset();
            pageMail.reset();
            pageCities.reset();
            pageTransports.reset();
            pageSports.reset();
            pageWork.reset();
        }

        PageStart { id: pageStart; }
        PageRoles { id: pageRoles; backButtonRequired: false; }
        PageName { id: pageName; }
        PageMail { id: pageMail; }
        PageLoad { id: pageLoad_1; stepsBarRequired: true; titleRequired: false; }

        PageDescribeYourself { id: pageDescribeYourself; backButtonRequired: false; textStep_1: pageRoles.role; textStep_2: pageName.name; textStep_3: pageMail.mail; }
        PageCities { id: pageCities; }
        PageTransports { id: pageTransports; }
        PageSports { id: pageSports; }
        PageLoad { id: pageLoad_2; }

        PageWork { id: pageWork; backButtonRequired: false; }
        PageLoad { id: pageLoad_3; }

        PageFinal { id: pageFinal; }

        states: [
            State { when: layout.nextIndex === layout.currentIndex; PropertyChanges { target: layout; opacity: 1.0; } },
            State { when: layout.nextIndex !== layout.currentIndex; PropertyChanges { target: layout; opacity: 0.0; } }
        ]
        transitions: Transition { OpacityAnimator { target: layout } }
    }

//  ---- Overlay elements
    ButtonBack {
        id: backButton
        x: 24
        y: 24
        enabled: layout.nextIndex === layout.currentIndex && show
        show: layout.currentPage.backButtonRequired
        onClicked: { layout.nextIndex--; }
    }
    StepsBar {
        id: stepsBar
        anchors.verticalCenter: backButton.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        show: layout.currentPage.stepsBarRequired
        textStep_1: pageRoles.role
        textStep_2: pageName.name
        textStep_3: pageMail.mail
        step: layout.currentIndex
    }
    Title {
        id: title
        anchors.verticalCenter: backButton.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        show: layout.currentPage.titleRequired
    }
    DInputPanel {
        id: keyboard
        width: parent.width
        anchors.bottomMargin: -28
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        show: layout.currentPage.keyboardRequired && !resetPopup.visible
    }
    PopupReset { id: resetPopup; anchors.centerIn: parent; onReset: layout.reset(); }

//  ---- Connections
    Connections {
        target: layout.currentPage
        onNextPageRequested: {
            layout.nextIndex = (layout.currentIndex + 1) % layout.count;
            if (layout.nextIndex === 0)
                layout.reset();
        }
        onPopupRequested: {
            if (layout.currentIndex !== 0 && layout.currentIndex !== layout.count - 1)
                resetPopup.open();
        }
    }
}
