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

        readonly property DPage currentPage: children[layout.currentIndex]
        readonly property DPage nextPage: children[layout.nextIndex]
        property int nextIndex: 0

        function reset() {
            layout.nextIndex = 0;
            rolesPage.reset();
            namePage.reset();
            mailPage.reset();
            citiesPage.reset();
            transportsPage.reset();
            sportsPage.reset();
            workPage.reset();
        }

        onOpacityChanged: { if(!opacity) currentIndex = nextIndex; }
        states: State { when: layout.nextIndex !== layout.currentIndex; PropertyChanges { target: layout; opacity: 0.0; } }
        transitions: Transition { OpacityAnimator { target: layout } }

        StartPage { id: startPage; }
        RolesPage { id: rolesPage; }
        NamePage { id: namePage; textStep_1: rolesPage.role; }
        MailPage { id: mailPage; textStep_1: rolesPage.role; textStep_2: namePage.name; }
        LoadPageStep { id: loadPage_1; textStep_1: rolesPage.role; textStep_2: namePage.name; textStep_3: mailPage.mail; }

        DescribeYourselfPage { id: describeYourselfPage; backButtonRequired: false; }
        CitiesPage { id: citiesPage; }
        TransportsPage { id: transportsPage; }
        SportsPage { id: sportsPage; }
        LoadPage { id: loadPage_2; }

        WorkPage { id: workPage; backButtonRequired: false; }
        LoadPage { id: loadPage_3; }

        FinalPage { id: finalPage; }
    }

//  ---- Overlay elements
    ButtonBack {
        id: backButton
        x: 24
        y: 24
        show: layout.currentPage.backButtonRequired
        onClicked: { layout.nextIndex--; }
    }
    Title {
        id: title
        anchors.verticalCenter: backButton.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        show: layout.currentPage.titleRequired
    }
    Keyboard {
        id: keyboard
        width: parent.width
        anchors.bottomMargin: -28
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        show: layout.nextPage.keyboardRequired && !resetPopup.visible
    }
    PopupReset { id: resetPopup; anchors.centerIn: parent; }

//  ---- Connections
    Connections {
        target: layout.currentPage
        onNextPageRequested: {
            layout.nextIndex = (layout.currentIndex + 1) % layout.count;
            if (layout.nextIndex === 0)
                layout.reset();
        }
        onPopupRequested: {
            if (layout.currentIndex !== 0)
                resetPopup.open();
        }
    }
}
