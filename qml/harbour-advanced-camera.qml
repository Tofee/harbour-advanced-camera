import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia 5.15
import "pages"

Item {
    id: window

    height:1920
    width: 1080

    Settings {
        id: settings
    }

    Rectangle {
        z: -1
        anchors.fill: parent
        color: "black"
    }

    VideoOutput {
        id: captureView
        source: cameraUI.camera
        width: window.width
        height: window.height
        z: -1
    }

    StackView {
        id: pageStack
        anchors.fill: parent
        initialItem: CameraUI {
            id: cameraUI
        }
    }
}
