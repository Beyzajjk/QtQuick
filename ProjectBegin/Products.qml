
import QtQuick 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Dialogs 1.3


Rectangle {
    id: firstRectId
    width: 800
    height: 950
    color: "transparent"
    radius: 20


    SwipeView {
        id: view
        currentIndex: 1
        anchors.fill: parent
        spacing: 40
        Rectangle {
            width: animation.width; height: animation.height + 8
            color: "transparent"
            AnimatedImage {
                id: animation;
                x: 30 ; y: 30
                source: darkMode ? "qrc:/Images/tonic2.gif" : "qrc:/Images/tonic.gif"
            Button {
                text: "Shop"
                x: 340 ; y: 680
                width: parent.width * 0.3
                height: 40
                onClicked: {
                    Qt.openUrlExternally("https://flavus.com/products/skin-lab-barrierderm-pure-toner-180ml")
                }
            }

            }
            Rectangle {
                property int frames: animation.frameCount
                anchors.centerIn: parent
                width: 4; height: 8
                x: (animation.width - width) * animation.currentFrame / frames
                y: animation.height
                color: "transparent"
            }
        }
        Rectangle {
            width: animation2.width; height: animation2.height + 8
            color: "transparent"
            AnimatedImage {
                id: animation2;
                x: 30 ; y: 30
                source: darkMode ? "qrc:/Images/cleanser2.gif" : "qrc:/Images/cleanser.gif"
                Button {
                    text: "Shop"
                    x: 340 ; y: 680
                    width: parent.width * 0.3
                    height: 40
                    onClicked: {
                        Qt.openUrlExternally("https://flavus.com/products/skin-lab-porebarrier-cleansing-balm-100ml-1-bha-i-ceren-akne-ve-siyah-nokta-karsiti-yag-bazli-temizleyici")
                    }
                }}
            Rectangle {
                property int frames: animation2.frameCount
                anchors.centerIn: parent
                width: 4; height: 8
                x: (animation2.width - width) * animation2.currentFrame / frames
                y: animation2.height
                color: "transparent"
            }
        }
        Rectangle {
            width: animation3.width; height: animation3.height + 8
            color: "transparent"
            AnimatedImage {
                id: animation3;
                x: 30 ; y: 30
                source: darkMode ? "qrc:/Images/lotion2.gif" : "qrc:/Images/lotion.gif"
                Button {
                    text: "Shop"
                    x: 340 ; y: 680
                    width: parent.width * 0.3
                    height: 40
                    onClicked: {
                        Qt.openUrlExternally("https://flavus.com/products/barrierderm-relief-balm-45ml")
                    }
                }}
            Rectangle {
                property int frames: animation3.frameCount
                anchors.centerIn: parent
                width: 4; height: 8
                x: (animation3.width - width) * animation3.currentFrame / frames
                y: animation3.height
                color: "transparent"
            }
        }
    }

    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
