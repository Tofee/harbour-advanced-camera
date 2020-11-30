pragma Singleton

import QtQuick 2.0

import LunaNext.Common 0.1

QtObject {
    Component.onCompleted: console.log("dpi = "+Settings.dpi);

    property real itemSizeSmall: Units.gu(5);
    property real itemSizeLarge: Units.gu(15);

    property real paddingSmall: Units.gu(1);
    property real paddingMedium: Units.gu(2);
    property real paddingLarge: Units.gu(3);


    property color highlightBackgroundColor: "orange"
    property color primaryColor: "lightblue"
    property color lightPrimaryColor: "lightgray"
}
