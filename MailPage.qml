import QtQuick 2.12

DPage {
    id: root
    stepsBarRequired: true
    titleRequired: false
    keyboardRequired: true

    readonly property string mail: mailNameText.text + "@" + mailDomainText.text

    function reset() { mailNameText.text = ""; mailDomainText.text = ""; mailDomainText.colorOverride = ""; }

    Column {
        y: 144
        anchors.horizontalCenter: parent.horizontalCenter
        DTextThin {
            id: field
            anchors.left: mailRow.left
            text: qsTr("MAIL ADDRESS")
            font.pixelSize: 16
        }
        Row {
            id: mailRow
            height: 72;
            anchors.horizontalCenter: parent.horizontalCenter
            DTextField {
                id: mailNameText
                width: 212
                height: parent.height
                placeholderText: qsTr(" john.smith")
                inputMethodHints: Qt.ImhEmailCharactersOnly
                onVisibleChanged: { if (visible) forceActiveFocus(); }
                onAccepted: {
                    if (!mailDomainText.isValid)
                        mailDomainText.focus = true;
                    else if (text)
                        root.nextPageRequested();
                }
            }
            DText {
                width: 56
                anchors.verticalCenter: parent.verticalCenter
                text: "@"
                color: Colors.green
            }
            DTextField {
                id: mailDomainText
                width: 212
                height: parent.height
                placeholderText: " mail.com"
                inputMethodHints: Qt.ImhEmailCharactersOnly

                readonly property bool isValid: text.indexOf(".") > 0 && text.length > text.indexOf(".") + 2

                onAccepted: {
                    colorOverride = !text || isValid ? "" : Colors.red;
                    if (!mailNameText.text)
                        mailNameText.focus = true;
                    else if (isValid)
                        root.nextPageRequested();
                }
                onTextChanged: { if (!text) colorOverride = ""; }
            }
        }
    }
}
