import QtQuick 2.12

DPageStep {
    id: root
    step: 4

    LoadingImage {
        anchors.centerIn: parent
        onEnded: root.nextPageRequested()
    }
}
