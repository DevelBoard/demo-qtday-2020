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
        height: 380
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
            spacing: 40
            Text {
                id: creditsText
                width: 544
                text: "Illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure Illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem."
                font.pixelSize: 20
                font.family: "Helvetica"
                wrapMode: Text.Wrap
                color: Colors.white
            }
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
