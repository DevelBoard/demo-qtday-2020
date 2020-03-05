import QtQuick 2.12
import QtQuick.VirtualKeyboard 2.4

DPageStep {
    id: root
    step: 3
    textField: qsTr("MAIL ADDRESS")

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
            onAccepted: {
                if (!mailDomainText.text)
                {
                    mailDomainText.focus = true;
                    return;
                }
                if (text)
                    root.nextPageRequested();
            }
            focus: Boolean(text)
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
            onAccepted: {
                if (!mailNameText.text)
                {
                    mailNameText.focus = true;
                    return;
                }
                if (text)
                    root.nextPageRequested();
            }
            focus: Boolean(text)
        }
    }

    InputPanel {
        width: parent.width
        enabled: mailNameText.focus || mailDomainText.focus
        anchors.bottomMargin: -28
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        externalLanguageSwitchEnabled: false
    }
}
