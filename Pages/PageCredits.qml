import QtQuick 2.12
import QtQuick.Controls 2.12

Image {
    id: root
    enabled: show
    opacity: 0.0
    source: "assets/develboard_bg-1.png"

    property bool show: false

    onOpacityChanged: { if (!opacity) flickable.contentY = 0; }

    transitions: Transition { OpacityAnimator { target: root; duration: 500; } }
    states: [
        State { when: !root.show; PropertyChanges { target: root; opacity: 0.0; } },
        State { when: root.show; PropertyChanges { target: root; opacity: 1.0; } }
    ]

    Flickable {
        id: flickable
        width: 624
        height: Math.min(creditsContent.height, 380)
        y: 80
        anchors.horizontalCenter: parent.horizontalCenter
        contentWidth: creditsContent.width
        contentHeight: creditsContent.height
        clip: true
        flickableDirection: Flickable.VerticalFlick

        Rectangle {
            anchors.fill: parent
            color: Colors.blue
        }
        Column {
            id: creditsContent
            width: parent.width
            topPadding: 48
            bottomPadding: topPadding
            leftPadding: 24
            rightPadding: 56
            spacing: 16
            DText {
                text: "Cities icons"
                font.pixelSize: 16
                font.capitalization: Font.AllUppercase
                color: Colors.lightgrey
                horizontalAlignment: Text.AlignLeft
            }
            DText {
                width: 544
                text: "© Copyright by Agente Studio Minsk, Krasnozvezdnaya street - 18B, room 611\nMinsk 220034 Belarus\n\nhttps://creativecommons.org/licenses/by/4.0/legalcode"
                font.pixelSize: 14
                lineHeight: 1.5
                wrapMode: Text.Wrap
                color: Colors.white
                horizontalAlignment: Text.AlignLeft
            }
            Rectangle { height: 40; width: parent.width; color: "transparent" }
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: "assets/ic_develer.png"
            }
        }
        ScrollBar.vertical: ScrollBar {
            topPadding: creditsContent.topPadding
            bottomPadding: creditsContent.bottomPadding
            leftPadding: 20
            rightPadding: 20
            width: 4 + leftPadding + rightPadding
            policy: ScrollBar.AlwaysOn
            background: Rectangle {
                width: parent.availableWidth * 2
                height: parent.availableHeight + parent.availableWidth * 3 / 2
                x: parent.leftPadding - parent.availableWidth / 2
                y: parent.topPadding - parent.availableWidth / 2
                color: Colors.lightblue
                radius: width / 2
            }
            contentItem: Rectangle {
                color: Colors.lightgreen
                radius: width / 2
            }
        }
    }
}
