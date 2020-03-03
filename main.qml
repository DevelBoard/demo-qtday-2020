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
        RolePage { id: rolePage; }
        NamePage { id: namePage; textStep_1: rolePage.selection; }
        MailPage { id: mailPage; textStep_1: rolePage.selection; textStep_2: namePage.name; }
        LoadPage { id: loadPage; textStep_1: rolePage.selection; textStep_2: namePage.name; textStep_3: mailPage.mail; }
        WizardPage1 {}
        WizardPage2 {}
        WizardPage3 {}
        WizardPage4 {}
        WizardPage5 {}
        WizardPage6 {}
    }
    DButton {
        visible: layout.currentIndex > 0
        source: "assets/ic_back.png"
        onClicked: { layout.currentIndex--; }
        x: 24
        y: 24
    }
    Connections {
        target: layout.children[layout.currentIndex]
        onNextPageRequested: { layout.currentIndex = Math.min(layout.count - 1, layout.currentIndex + 1); }
    }
}
