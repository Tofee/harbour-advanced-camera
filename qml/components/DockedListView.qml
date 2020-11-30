import QtQuick 2.15
import QtQuick.Controls 2.15

import "../theme"

Dialog {
    id: panel

    property alias model: listView.model
    property var selectedItem
    modal: true
    animationDuration: 250

    signal clicked(var value)

    width: parent.width / 2
    height: parent.height
    z: 99

    dock: Dock.Left
    clip: true

    Rectangle {
        anchors.fill: parent
        color: Theme.colorScheme === Theme.LightOnDark ? "black" : "white"
        opacity: 0.7

        ListView {
            id: listView
            anchors.fill: parent
            VerticalScrollDecorator {
            }
            clip: true

            delegate: Item {
                width: ListView.view.width
                height: Theme.itemSizeSmall
                highlighted: value === selectedItem

                Label {
                    anchors {
                        left: parent.left
                        leftMargin: Theme.horizontalPageMargin
                        right: parent.right
                        rightMargin: Theme.horizontalPageMargin
                        verticalCenter: parent.verticalCenter
                    }
                    color: highlighted ? Theme.highlightColor : Theme.primaryColor
                    text: name
                    truncationMode: TruncationMode.Fade
                }
                onClicked: {
                    panel.clicked(value)
                }
            }
        }
    }
}
