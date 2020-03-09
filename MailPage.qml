import QtQuick 2.12

DPageStep {
    id: root
    step: 3
    textField: qsTr("MAIL ADDRESS")
    keyboardRequired: true

    readonly property string mail: mailNameText.text + "@" + mailDomainText.text


    Row {
        height: 72;
        y: 152
        anchors.horizontalCenter: parent.horizontalCenter
        DTextField {
            id: mailNameText
            width: 212
            height: parent.height
            placeholderText: qsTr("john.smith")
            inputMethodHints: Qt.ImhEmailCharactersOnly
            onVisibleChanged: { if (visible && !text) forceActiveFocus(); }
            onAccepted: {
                if (!mailDomainText.isValid)
                {
                    mailDomainText.focus = true;
                    return;
                }
                if (!text)
                    return;
                root.nextPageRequested();
            }
        }
        DText {
            width: 56
            anchors.verticalCenter: parent.verticalCenter
            text: "@"
            color: "#77FF9C"
        }
        DTextField {
            id: mailDomainText
            width: 212
            height: parent.height
            placeholderText: "mail.com"
            inputMethodHints: Qt.ImhEmailCharactersOnly

            readonly property bool isValid: text.indexOf(".") > 0 && text.length > text.indexOf(".") + 1

            onAccepted: {
                if (!mailNameText.text)
                {
                    mailNameText.focus = true;
                    return;
                }
                if (!text)
                    return;
                focus = false;
                if (isValid)
                    root.nextPageRequested();
            }
            colorOverride: (Boolean(text) && !focus && !isValid) ? "red" : ""
        }
    }
}
