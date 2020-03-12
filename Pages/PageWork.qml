import QtQuick 2.12
import QtQuick.Shapes 1.12

DPage {
    id: root
    subtitle: qsTr("Mix the subjects of your standard work day!")
    button: ButtonNext { id: next; enabled: root.selected; onClicked: root.nextPageRequested(); }

    property bool selected: false

    function reset() {
        slidersGroup.breakBindings();
        workCoding.value = workSwDesign.value = workGaming.value = 0.5;
        selected = false;
        slidersGroup.restoreBindings();
    }

    Column {
        id: slidersGroup
        x: 40
        y: 132

        readonly property double updateTriggerThreshold: 0.000001
        property double functionalTotal: workCoding.functionalValue + workSwDesign.functionalValue + workGaming.functionalValue
        property double functionalDelta: functionalTotal - 1.0
        property bool shouldAdjust: Math.abs(functionalDelta) > updateTriggerThreshold
        property int lastSliderMovedIndex: -1

        DelegateWork { id: workCoding; text: qsTr("Coding\nthousands of rows..."); color: "#FF29FF"; lightcolor: "#66FF29FF"; onValueChanged: { root.selected = true; slidersGroup.lastSliderMovedIndex = 0; } }
        DelegateWork { id: workSwDesign; text: qsTr("Software design"); color: "#29FFEF"; lightcolor: "#6629FFEF"; onValueChanged: { root.selected = true; slidersGroup.lastSliderMovedIndex = 1; } }
        DelegateWork { id: workGaming; text: qsTr("Just gaming!"); color: "#A4FF29"; lightcolor: "#66A4FF29"; onValueChanged: { root.selected = true; slidersGroup.lastSliderMovedIndex = 2; } }

        function breakBindings() {
            functionalTotal = functionalTotal;
            functionalDelta = functionalDelta;
            shouldAdjust = shouldAdjust;
        }
        function restoreBindings() {
            functionalTotal = Qt.binding(function() { return workCoding.functionalValue + workSwDesign.functionalValue + workGaming.functionalValue; })
            functionalDelta = Qt.binding(function() { return functionalTotal - 1.0; })
            shouldAdjust = Qt.binding(function() { return Math.abs(functionalDelta) > updateTriggerThreshold; })
        }

        onShouldAdjustChanged: {
            if (!shouldAdjust)
                return;

            var movedSlider = children[lastSliderMovedIndex];
            var unmovedFunctionalTarget = 1.0 - movedSlider.functionalValue

            var unmovedSlider_1 = children[(lastSliderMovedIndex + 1) % 3];
            var unmovedSlider_2 = children[(lastSliderMovedIndex + 2) % 3];

            var unmovedFunctionalTotal = unmovedSlider_1.functionalValue + unmovedSlider_2.functionalValue;
            var unmovedRatio_1 = unmovedFunctionalTotal ? unmovedSlider_1.functionalValue / unmovedFunctionalTotal : 0.5;
            var unmovedRatio_2 = unmovedFunctionalTotal ? unmovedSlider_2.functionalValue / unmovedFunctionalTotal : 0.5;

            breakBindings();
            unmovedSlider_1.setFunctionalValue(unmovedFunctionalTarget * unmovedRatio_1);
            unmovedSlider_2.setFunctionalValue(unmovedFunctionalTarget * unmovedRatio_2);
            restoreBindings();
        }
    }

    Image {
        y: 104
        x: 504
        source: "assets/comp_clock.png"

        Shape {
            id: chart
            width: 104
            height: 104
            anchors.horizontalCenterOffset: 1
            anchors.verticalCenterOffset: -8
            anchors.centerIn: parent

            readonly property int strokeWidth: 13

            DWorkActivityShapePath {
                id: shapePath_0
                end: workCoding.functionalValue
                strokeColor: workCoding.color
                strokeWidth: chart.strokeWidth
                radius: chart.width / 2
            }
            DWorkActivityShapePath {
                id: shapePath_1
                start: shapePath_0.end
                end: start + workSwDesign.functionalValue
                strokeColor: workSwDesign.color
                strokeWidth: chart.strokeWidth
                radius: chart.width / 2
            }
            DWorkActivityShapePath {
                id: shapePath_2
                start: shapePath_1.end
                strokeColor: workGaming.color
                strokeWidth: chart.strokeWidth
                radius: chart.width / 2
            }
        }
    }
}
