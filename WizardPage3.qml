import QtQuick 2.12
import QtQuick.Controls 2.12

DPageSubTitled {
    id: root
    text: qsTr("Your way to move in a work day?")

    readonly property bool selected: Boolean(transport) && selectedDistance
    property bool selectedDistance: false
    property string transport: ""
    property int distance: Math.floor(slider.value)

//    onTransportChanged: console.log(transport)

    PathView {
        id: transportsList
        width: 300
        height: 240
        x: 80
        y: 112
        pathItemCount: 5
        highlightMoveDuration: 200
        preferredHighlightBegin: 0.49
        preferredHighlightEnd: 0.51
        highlightRangeMode: ListView.StrictlyEnforceRange

        path: Path {
            startX: 130; startY: 0
            PathArc { x: 130; y: transportsList.height; radiusX: 100; radiusY: y / 2; }
        }
        model: ListModel {
            ListElement { transport: QT_TR_NOOP("Bycicle") }
            ListElement { transport: QT_TR_NOOP("Bus") }
            ListElement { transport: QT_TR_NOOP("Car") }
            ListElement { transport: QT_TR_NOOP("On foot") }
            ListElement { transport: QT_TR_NOOP("Motorbike") }
            ListElement { transport: QT_TR_NOOP("Train") }
            ListElement { transport: QT_TR_NOOP("Tram") }
        }
        delegate: TransportDelegate {
            width: transportsList.width
            selected: PathView.isCurrentItem
            text: qsTr(transport)
            onClicked: {
                transportsList.currentIndex = index;
                root.transport = transport;
            }
        }
        Component.onCompleted: { currentIndex = 4; }
        onVisibleChanged: { if (!root.selectedTransport) currentIndex = 4; }
    }
    Rectangle {
        id: separator
        width: 1
        height: 232
        y: 112.5
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#2E4254"
    }
    Rectangle {
        width: 160
        height: 160
        radius: 80
        y: 104
        anchors.right: parent.right
        anchors.rightMargin: 96
        gradient: Gradient {
                GradientStop { position: 1.0; color: "#041B2B" }
                GradientStop { position: 0.0; color: "#2E4254" }
        }

        Row {
            height: textValue.height
            anchors.centerIn: parent
            spacing: 4
            DText {
                id: textValue
                text: root.distance
                color: "#77FF9C"
                font.pixelSize: 32
            }
            DText {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                text: "km"
                color: "#92A6BF"
                font.pixelSize: 18
            }
        }
    }
    Slider {
        id: slider
        width: 256 + leftPadding + rightPadding
        height: 70 + topPadding + bottomPadding
        y: 271 - topPadding
        anchors.right: parent.right
        anchors.rightMargin: 48 - rightPadding
        leftPadding: 48
        rightPadding: 48
        topPadding: 48
        from: 0
        to: 100
        background: Rectangle {
            x: slider.leftPadding
            y: slider.topPadding - height / 2
            height: 1
            width: slider.availableWidth
            color: "#92A6BF"
            Rectangle {
                width: slider.visualPosition * parent.width
                height: parent.height
                gradient: Gradient {
                        orientation: Gradient.Horizontal
                        GradientStop { position: 0.49; color: "#77FF9C" }
                        GradientStop { position: 0.0; color: "#3377FF9C" }
                }
                Rectangle {
                    width: 9
                    height: 9
                    y: -height / 2
                    anchors.right: parent.right
                    anchors.rightMargin: -width / 2
                    color: "#77FF9C"
                    radius: 4.5
                }
            }
        }
        handle: Image {
            x: slider.leftPadding + slider.visualPosition * slider.availableWidth - width / 2
            y: slider.topPadding + 8
            source: "assets/ic_handle.png"
        }
        onVisibleChanged: { if (!root.selectedDistance) value = 0; }
        onMoved: { root.selectedDistance = true; }
    }

    DButton {
        y: 368
        anchors.horizontalCenter: parent.horizontalCenter
        enabled: root.selected
        source: enabled ? "assets/btn/btn_next-active.png" : "assets/btn/btn_next-disable.png"
        onClicked: root.nextPageRequested()
    }
}
