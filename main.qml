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

        property int nextIndex: 0

        onOpacityChanged: { if(!opacity) currentIndex = nextIndex; }
        states: State { when: layout.nextIndex !== layout.currentIndex; PropertyChanges { target: layout; opacity: 0.0; } }
        transitions: Transition { NumberAnimation { properties: "opacity"; } }

        function reset() {
            rolesPage.reset();
            namePage.reset();
            mailPage.reset();
            citiesPage.reset();
            transportsPage.reset();
            sportsPage.reset();
            workPage.reset();
        }

        StartPage { }
        RolesPage { id: rolesPage; }
        NamePage { id: namePage; textStep_1: rolesPage.selection; }
        MailPage { id: mailPage; textStep_1: rolesPage.selection; textStep_2: namePage.name; }
        LoadPageStep { id: loadPageStep; textStep_1: rolesPage.selection; textStep_2: namePage.name; textStep_3: mailPage.mail; }

        DescribeYourselfPage { id: describeYourselfPage }
        CitiesPage { id: citiesPage }
        TransportsPage { id: transportsPage }
        SportsPage { id: sportsPage }
        LoadPage { id: loadPage }
        WorkPage { id: workPage }
        FinalPage { id: finalPage}
    }
    DButton {
        visible: layout.currentIndex > 0
        x: 24
        y: 24
        source: "assets/ic_back.png"
        onClicked: { layout.currentIndex--; }
    }
    Keyboard {
        id: keyboard
        visible: opacity > 0.0
        opacity: 0.0
        width: parent.width
        anchors.bottomMargin: -28
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        states: State { when: layout.children[layout.currentIndex].keyboardRequired; PropertyChanges { target: keyboard; opacity: 1.0; } }
        transitions: Transition { NumberAnimation { properties: "opacity"; } }
    }
    Connections {
        target: layout.children[layout.currentIndex]
        onNextPageRequested: {
            layout.nextIndex = (layout.currentIndex + 1) % layout.count;
            if (layout.nextIndex === 0)
                layout.reset();
        }
    }
}
