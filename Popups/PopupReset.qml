import QtQuick 2.12
import QtQuick.Controls 2.12

Popup {
    id: root

    signal reset()

    closePolicy: Popup.NoAutoClose
    background: Rectangle {
        width: window.width
        height: window.height
        anchors.centerIn: root.contentItem
        color: Colors.transparentblue
    }
    contentItem: Image {
        source: "assets/pop-up/bg_pop-up.png"
        DTextThin {
            width: 378
            y: 28
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 22
            lineHeight: 1.1
            text: "Are you sure you want to reset\nyour Qt Music experience?\nYou'll lose all the entered data."
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 7
            spacing: 24
            ButtonCancel { onClicked: root.close(); }
            ButtonReset { onClicked: { root.reset(); root.close(); } }
        }
    }
    enter: Transition { id: fadeIn; NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; duration: 500; } }
    exit: Transition { id: fadeOut; NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; duration: 500; } }
}
