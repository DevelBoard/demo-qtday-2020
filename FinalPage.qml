import QtQuick 2.12

DPage {
    id: root
    backButtonRequired: false
    contentIsText: qsTr("Check out your mail box\nand get your own Qt playlist in Spotify!\n")
    button: ButtonThanks { id: thanks; y: -56; onClicked: root.nextPageRequested(); }

    DText {
        width: contentWidth * 3
        height: contentHeight * 3.5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: qsTr("Credits")
        color: Colors.lightgreen
        font.pixelSize: 18
        font.underline: true
        verticalAlignment: Text.AlignVCenter

        MouseArea {
            anchors.fill: parent
            onClicked: { creditsPage.visible = true; }
        }
    }

    CreditsPage {
        id: creditsPage
        visible: false

        ButtonClose {
            x: 736
            y: 24
            onClicked: { creditsPage.visible = false; }
        }
    }
}
