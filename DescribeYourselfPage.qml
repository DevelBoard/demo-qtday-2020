DPage {
    id: root
    button: ButtonStart { onClicked: root.nextPageRequested() }
    contentIsText: qsTr("Cities, sports and urban activity!\nDescribe yourself and get your own Qt sound!")
}
