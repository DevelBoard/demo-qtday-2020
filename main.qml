import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.LocalStorage 2.12

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

        property date beginningTimestamp
        property bool isExperienceFinished: false
        readonly property var db: LocalStorage.openDatabaseSync("QtDay2020_DB", "1.0", "A collection of all the entries collected during QtDay 2020.")

        Component.onCompleted: layout.db.transaction(function(tx) {
            // Create the database table if it doesn't already exist
            tx.executeSql('CREATE TABLE IF NOT EXISTS UserExperiences(id INTEGER PRIMARY KEY AUTOINCREMENT, timestamp_start DATETIME, timestamp_end DATETIME, finished BOOLEAN, name TEXT, mail TEXT, role TEXT, city TEXT, transport TEXT, work_distance INTEGER, bycicle BOOLEAN, crossfit BOOLEAN, gym BOOLEAN, running BOOLEAN, soccer BOOLEAN, surf BOOLEAN, swimming BOOLEAN, tennis BOOLEAN, coding INTEGER, sw_design INTEGER, gaming INTEGER)');
        })

        function saveUserExperience() {
            layout.db.transaction(function(tx) {
                    // Add an entry
                    tx.executeSql('INSERT INTO UserExperiences(timestamp_start, timestamp_end, finished, name, mail, role, city, transport, work_distance, bycicle, crossfit, gym, running, soccer, surf, swimming, tennis, coding, sw_design, gaming) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [ beginningTimestamp, new Date(), isExperienceFinished, pageName.name, pageMail.mail, pageRoles.role, pageCities.city, pageTransports.transport, pageTransports.distance, pageSports.bycicleSelected, pageSports.crossfitSelected, pageSports.gymSelected, pageSports.runningSelected, pageSports.soccerSelected, pageSports.surfSelected, pageSports.swimmingSelected, pageSports.tennisSelected, pageWork.coding, pageWork.swDesign, pageWork.gaming ]);
                    // Show all added entries
                    var rs = tx.executeSql('SELECT * FROM UserExperiences');
                    for (var i = 0; i < rs.rows.length; i++)
                        console.log(JSON.stringify(rs.rows.item(i)))
                }
            )
        }

        function reset() {
            saveUserExperience();
            nextIndex = 0;
            isExperienceFinished = false;
            pageRoles.reset();
            pageName.reset();
            pageMail.reset();
            pageCities.reset();
            pageTransports.reset();
            pageSports.reset();
            pageWork.reset();
        }

        PageStart { id: pageStart; onNextPageRequested: { layout.beginningTimestamp = new Date(); }}
        PageRoles { id: pageRoles; backButtonRequired: false; }
        PageName { id: pageName; }
        PageMail { id: pageMail; }
        PageLoad { id: pageLoad_1; stepsBarRequired: true; titleRequired: false; }

        PageDescribeYourself { id: pageDescribeYourself; backButtonRequired: false; textStep_1: pageRoles.role; textStep_2: pageName.name; textStep_3: pageMail.mailShort; }
        PageCities { id: pageCities; }
        PageTransports { id: pageTransports; }
        PageSports { id: pageSports; }
        PageLoad { id: pageLoad_2; }

        PageWork { id: pageWork; backButtonRequired: false; }
        PageLoad { id: pageLoad_3; }

        PageFinal { id: pageFinal; onNextPageRequested: { layout.isExperienceFinished = true; layout.reset(); } }

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
    DStepsBar {
        id: stepsBar
        anchors.verticalCenter: backButton.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        show: layout.currentPage.stepsBarRequired
        textStep_1: pageRoles.role
        textStep_2: pageName.name
        textStep_3: pageMail.mailShort
        step: layout.currentIndex
    }
    DTitle {
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
    DDrawer { width: window.width; height: window.height; }

//  ---- Connections
    Connections {
        target: layout.currentPage
        onNextPageRequested: { layout.nextIndex = (layout.currentIndex + 1) % layout.count; }
        onPopupRequested: {
            if (layout.currentIndex !== 0 && layout.currentIndex !== layout.count - 1)
                resetPopup.open();
        }
    }
}
