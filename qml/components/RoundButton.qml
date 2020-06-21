import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: button
    property string image: ""
    property alias icon: iconButton.icon
    property int size: 30 //Theme.itemSizeSmall
    property alias down: iconButton.down
    signal clicked
    signal pressed

    height: size
    width: size

    RoundButton {
        id: iconButton
        anchors.fill: parent
        radius: width / 2
        opacity: 0.7

        icon.source: button.image
        onClicked: button.clicked()
        onPressed: button.pressed()
    }
}
