import QtQuick 2.15
import QtQuick.Controls 2.15

import "../theme"

Item {
    id: iconSwitch
    property alias icon1Source: icon1.icon.source
    property alias icon2Source: icon2.icon.source
    property string button1Name: ""
    property string button2Name: ""
    signal clicked(var name)

    property Item  _highlightedItem: icon1

    height: icon1.height + icon2.height

    RoundButton {
        id: icon1
        width: parent.width
        height: width
        z: 0
        icon.height: icon1.height
        icon.width: icon1.width
        icon.color: _highlightedItem == icon1 ? Theme.highlightBackgroundColor : "transparent"

        onClicked: {
            _highlightedItem = icon1;
            iconSwitch.clicked(button1Name)
        }
    }

    RoundButton {
        id: icon2
        width: parent.width
        height: width
        anchors.top: icon1.bottom
        z: 0
        icon.height: icon2.height
        icon.width: icon2.width
        icon.color: _highlightedItem == icon2 ? Theme.highlightBackgroundColor : "transparent"

        onClicked: {
            _highlightedItem = icon2;
            iconSwitch.clicked(button2Name)
        }
    }
}
