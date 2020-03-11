import QtQuick 2.12
import QtQuick.Controls 2.12

Slider {
    id: root
    width: 248 + leftPadding + rightPadding
    height: 64
    x: 188
    leftPadding: 20
    rightPadding: 20
    value: 0.5

    // Yes, POW is slow.
    // From a design specification point of view, POW is the mathematically
    // correct way to display the desired behaviour for sliders compensation.
    // The most accurate method was chosen since the target doesn't seem to
    // suffer from POW usage.
    // An optimized version could leverage a 2nd grade approximation function:
    // f(x) = 1/3 * x + 2/3 * x^2
    //
    // Look at the functions involved at:
    // https://www.geogebra.org/graphing/a7w4qrsq
    readonly property real exponent: 1.5849625007209
    readonly property real invExponent: 1 / exponent
    readonly property real functionalValue: Math.pow(value, exponent)
    property color color: Colors.grey
    property color lightcolor: Colors.white
    property alias text: workName.text

    function setFunctionalValue(newFunctionalValue) { value = Math.pow(newFunctionalValue, invExponent); }

    background: Rectangle {
        x: root.leftPadding
        anchors.verticalCenter: root.verticalCenter
        height: 8
        width: root.availableWidth
        color: Colors.lightblue
        Rectangle {
            width: root.visualPosition * parent.width
            height: parent.height
            gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 1.0; color: root.color }
                    GradientStop { position: 0.0; color: root.lightcolor }
            }
        }
    }
    handle: Image {
        x: root.leftPadding + root.visualPosition * root.availableWidth - width / 2
        anchors.verticalCenter: root.verticalCenter
        source: "assets/ic_handle-bar.png"
    }

    DText {
        id: workName
        width: 176
        x: -188
        anchors.verticalCenter: root.verticalCenter
        color: Colors.lightgrey
        font.pixelSize: 14
        wrapMode: Text.Wrap
        font.capitalization: Font.AllUppercase
        horizontalAlignment: Text.AlignLeft
    }
}
