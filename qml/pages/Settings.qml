import QtQuick 2.15
import QtMultimedia 5.15
// import Qt.labs.settings 1.0

Item {
    property alias global: globalSettings
    property alias mode: modeSettings
    property alias jollaCamera: jollaCameraSettings

    // use Settings ?
    QtObject {
        id: globalSettings
        //category: "/uk/co/piggz/harbour-advanced-camera"
        property int cameraCount: 2
        property string cameraId: "primary"
        property string captureMode: "image"
        property bool swapZoomControl: false
        property string gridMode: "none"
        property string storagePath: StandardPaths.home
    }

    QtObject {
        id: modeSettings
        //category: globalSettings.cameraId + "/" + globalSettings.captureMode
        property string path: ""

        property int effect: CameraImageProcessing.ColorFilterNone
        property int exposure: Camera.ExposureManual
        property int flash: Camera.FlashOff
        property int focus: CameraFocus.FocusAuto
        property int iso: 0
        property string resolution: "2976x2976"
        property int whiteBalance: CameraImageProcessing.WhiteBalanceAuto
    }

    QtObject {
        id: jollaCameraSettings
        //category: "/apps/jolla-camera/" + globalSettings.cameraId + "/image"

        property string viewfinderResolution
        property string viewfinderResolution_16_9
        property string viewfinderResolution_4_3
    }

    function strToSize(siz) {
        var w = parseInt(siz.substring(0, siz.indexOf("x")))
        var h = parseInt(siz.substring(siz.indexOf("x") + 1))
        return Qt.size(w, h)
    }

    function sizeToStr(siz) {
        return siz.width + "x" + siz.height
    }

    //Return either the current mode resolution or default resolution for that mode
    function resolution(mode) {
        if (settings.global.captureMode === mode
                && settings.mode.resolution !== "") {
            var res = strToSize(settings.mode.resolution)
            if (modelResolution.isValidResolution(res, mode)) {
                return res
            }
        }
        return modelResolution.defaultResolution(mode)
    }
}
