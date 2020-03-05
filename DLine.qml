import QtQuick 2.12

Rectangle {
    id: root
    height: 1
    color: colorOverride ? colorOverride : colorDefault

    readonly property color colorDefault: fill === DLine.Full ? "#77FF9C" : "#92A6BF"
    property string colorOverride: ""
    property int fill: DLine.Empty

    enum Fill {
        Empty = 0,
        Half,
        Full
    }

    Rectangle {
        visible: root.fill === DLine.Half
        width: root.width * 0.875
        height: root.height
        gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop { position: 1.0; color: "#00ADFFCE" }
                GradientStop { position: 0.47; color: "#77FF9C" }
        }
    }
}
