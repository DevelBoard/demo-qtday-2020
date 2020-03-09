import QtQuick.Controls 2.12

Page {
    background: null
    property bool backButtonRequired: true
    property bool keyboardRequired: false
    property bool titleRequired: true
    signal nextPageRequested()
}
