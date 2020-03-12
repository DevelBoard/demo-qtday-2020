import QtQuick 2.12

Rectangle {
    id: root
    height: 1
    color: colorOverride ? colorOverride : colorDefault

    readonly property color colorDefault: fill === DLine.Full ? Colors.green : Colors.lightgrey
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
                GradientStop { position: 1.0; color: Colors.transparentlightgreen }
                GradientStop { position: 0.47; color: Colors.green }
        }
    }
}
