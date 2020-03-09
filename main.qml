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

        StartPage { }
        RolesPage { id: rolesPage; }
        NamePage { id: namePage; textStep_1: rolesPage.selection; }
        MailPage { id: mailPage; textStep_1: rolesPage.selection; textStep_2: namePage.name; }
        LoadPageStep { id: loadPage; textStep_1: rolesPage.selection; textStep_2: namePage.name; textStep_3: mailPage.mail; }

        DescribeYourselfPage {}
        CitiesPage {}
        TransportsPage {}
        SportsPage {}
        LoadPage {}
        WorkPage {}
        FinalPage {}
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
        onNextPageRequested: { layout.currentIndex = Math.min(layout.count - 1, layout.currentIndex + 1); }
    }
}
