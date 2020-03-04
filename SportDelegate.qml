DButton {
    source: baseSource + (selected ? "-active.png" : "-disable.png")

    property string baseSource: ""
    property bool selected: false

    onClicked: { selected = !selected; }
}
