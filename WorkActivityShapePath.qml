import QtQuick 2.12
import QtQuick.Shapes 1.12

ShapePath {
    id: root
    startX: radius * (1.0 + Math.cos(start * 2 * Math.PI))
    startY: radius * (1.0 + Math.sin(start * 2 * Math.PI))
    fillColor: "transparent"

    property double radius
    property double start: 0.0
    property double end: 1.0

    PathArc {
        x: radius * (1.0 + Math.cos(end * 2 * Math.PI))
        y: radius * (1.0 + Math.sin(end * 2 * Math.PI))
        useLargeArc: end - start > 0.5
        direction: PathArc.Clockwise
        radiusX: root.radius
        radiusY: root.radius
    }
}
