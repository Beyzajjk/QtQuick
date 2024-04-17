import QtQuick 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Universal 2.15
import Qt.labs.settings 1.1
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.15

Rectangle {
    id: homeRectId
    color: "transparent"
    radius: 20
    Rectangle {
        id: imageId
        anchors.fill: parent
        color: "transparent"
        radius: 20
        Text1 {
            height: parent.height * 0.6
            width: parent.width * 0.8
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    AnimatedImage {
        id: animation ; source: "qrc:/Images/giphy.gif"
        width: 160 ; height: 150
        x: 750 ; y:30
    }
    Header1 {
        x: 20 ; y:100
    }
}
