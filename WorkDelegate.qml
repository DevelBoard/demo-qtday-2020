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

    readonly property real exponent: 1.5849625007209
    readonly property real invExponent: 1 / exponent
    readonly property real functionalValue: Math.pow(value, exponent)
    property string color: "#FFFFFF"
    property alias text: workName.text

    function setFunctionalValue(newFunctionalValue) { value = Math.pow(newFunctionalValue, invExponent); }

    background: Rectangle {
        x: root.leftPadding
        anchors.verticalCenter: root.verticalCenter
        height: 8
        width: root.availableWidth
        color: "#2E4254"
        Rectangle {
            width: root.visualPosition * parent.width
            height: parent.height
            gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 1.0; color: root.color }
                    GradientStop { position: 0.0; color: "#66" + root.color.substring(1, 7) }
            }
        }
    }
    handle: Image {
        x: root.leftPadding + root.visualPosition * root.availableWidth - width / 2
        anchors.verticalCenter: root.verticalCenter
        anchors.verticalCenterOffset: 6
        source: "assets/ic_handle-bar.png"
    }

    DText {
        id: workName
        width: 176
        x: -188
        anchors.verticalCenter: root.verticalCenter
        color: "#92A6BF"
        font.pixelSize: 14
        wrapMode: Text.Wrap
        font.capitalization: Font.AllUppercase
        horizontalAlignment: Text.AlignLeft
    }
}
