import QtQuick 2.12
import QtQuick.Controls 2.12

DPage {
    id: root
    subtitle: qsTr("Describe your way to move in your typical day")
    button: ButtonNext { id: next; enabled: Boolean(transport) && selectedDistance; onClicked: root.nextPageRequested(); }

    property bool selectedDistance: false
    property string transport: ""
    readonly property int distance: Math.floor(slider.value)

    function reset() { transportsList.currentIndex = 0; transport = ""; slider.value = slider.from; selectedDistance = false; }

    PathView {
        id: transportsList
        width: 400
        height: 360
        y: 40
        pathItemCount: 5
        highlightMoveDuration: 200
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        highlightRangeMode: ListView.StrictlyEnforceRange

        path: Path {
            startX: 140; startY: 60
            PathArc { x: 140; y: 320; radiusX: 180; radiusY: y / 2; }
        }
        model: ListModel {
            id: transportsModel
            ListElement { transport: QT_TR_NOOP("Bicycle") }
            ListElement { transport: QT_TR_NOOP("Bus") }
            ListElement { transport: QT_TR_NOOP("Car") }
            ListElement { transport: QT_TR_NOOP("On foot") }
            ListElement { transport: QT_TR_NOOP("Motorbike") }
            ListElement { transport: QT_TR_NOOP("Train") }
            ListElement { transport: QT_TR_NOOP("Tram") }
        }
        delegate: DelegateTransport {
            width: transportsList.width
            selected: PathView.isCurrentItem
            text: qsTr(transport)
            onClicked: {
                transportsList.currentIndex = index;
                root.transport = transport;
            }
        }
        onVisibleChanged: { if (visible && !root.transport) currentIndex = 1; }
        onDragEnded: { root.transport = transportsModel.get(currentIndex).transport; }
    }
    Image {
        y: 104
        anchors.right: parent.right
        anchors.rightMargin: 96
        source: "assets/ic_gradient.png"
        Row {
            height: textValue.height
            anchors.centerIn: parent
            spacing: 4
            DText {
                id: textValue
                text: root.distance
                color: Colors.green
                font.pixelSize: 32
            }
            DText {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                text: "km"
                color: Colors.lightgrey
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
        to: 20
        background: Rectangle {
            x: slider.leftPadding
            y: slider.topPadding - height / 2
            height: 1
            width: slider.availableWidth
            color: Colors.lightgrey
            Rectangle {
                width: slider.visualPosition * parent.width
                height: parent.height
                gradient: Gradient {
                        orientation: Gradient.Horizontal
                        GradientStop { position: 0.49; color: Colors.green }
                        GradientStop { position: 0.0; color: Colors.transparentlightgreen }
                }
                Rectangle {
                    width: 9
                    height: 9
                    y: -height / 2
                    anchors.right: parent.right
                    anchors.rightMargin: -width / 2
                    color: Colors.green
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
}
