import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3

Rectangle {
    width: 950
    height: 950
    visible: true
    property bool showFirstGif: true
    property int currentGifIndex: 0
    property var gifList: ["qrc:/Images/jessica1.gif", "qrc:/Images/Tiffany.gif"]
    property color textColor: "black"
    property color pageColor: "white"
    Rectangle {
        id: dialogRect
        anchors.fill: parent
        Image {
            source: "qrc:/Images/background.jpg"
            anchors.fill: parent
        Text {
            id: colorText
            text: "NEWS FROM MAGAZINES"
            font.pixelSize: 18
            color: textColor
            anchors.horizontalCenter: parent.horizontalCenter
        }
        AnimatedImage {
            id: img
            source: "qrc:/Images/color.gif"
            width: 50
            height: 50
            anchors.right: parent.right
            anchors.top: parent.top
            property bool rounded: true
            property bool adapt: true
            layer.enabled: rounded
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: img.width
                    height: img.height
                    Rectangle {
                        anchors.centerIn: parent
                        width: img.adapt ? img.width : Math.min(img.width, img.height)
                        height: img.adapt ? img.height : width
                        radius: Math.min(width, height)
                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: colorDialog.open()
        }
    }

    function adjustColorBrightness(color, factor) {
        return Qt.rgba(Math.min(1.0, color.r + factor),
                       Math.min(1.0, color.g + factor),
                       Math.min(1.0, color.b + factor),
                       color.a);
    }

    ColorDialog {
        id: colorDialog
        color: "steelblue"

        onAccepted: {
            colorText.color = colorDialog.color
            colorText.text = "NEWS FROM MAGAZINES"
            textColor = colorDialog.color
        }

        onRejected: {
            colorText.text = "Renk Seçiniz"
        }
    }
    Timer {
        id: gifTimer
        interval: 3000 // 3 saniye
        running: false
        repeat: true
        onTriggered: {
            showFirstGif = !showFirstGif;
            gifTimer.restart();
        }
    }

    Item {
        width: parent.width
        height: parent.height
        // clip: true
        anchors.centerIn: parent
        AnimatedImage {
            smooth: true
            opacity: 1
            id: animation
            anchors.centerIn: parent
            source: showFirstGif ? "qrc:/Images/jessica1.gif" : "qrc:/Images/Tiffany.gif"
            width: 960
            height: 540
            fillMode: AnimatedImage.PreserveAspectFit
            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 3
                horizontalOffset: 3
                radius: 15
                color: "black"
            }
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                anchors.margins: -10
                hoverEnabled: true         //this line will enable mouseArea.containsMouse
            }
            states: State {
                name: "mouse-over"; when: mouseArea.containsMouse
                PropertyChanges { target: animation; scale: 0.8; opacity: 0}
                PropertyChanges { target: animationId; scale: 0.8; opacity: 1}
            }

            transitions: Transition {
                NumberAnimation { properties: "scale, opacity"; easing.type: Easing.InOutQuad; duration: 1000  }
            }
        }

        Component.onCompleted: {
            gifTimer.start();
        }
    }
    Item {
        width: parent.width
        height: parent.height
        // clip: true
        anchors.centerIn: parent
        AnimatedImage {
            smooth: true
            opacity: 0
            id: animationId
            anchors.centerIn: parent
            source: "qrc:/Images/Somi.gif"
            width: 960
            height: 540
            fillMode: AnimatedImage.PreserveAspectFit
            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 3
                horizontalOffset: 3
                radius: 15
                color: "black"
            }
        }
    }
  }
}
