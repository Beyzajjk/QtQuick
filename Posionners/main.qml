import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Posionners Demo")
    Rectangle {
        id: containerRectId
        width: 300
        height: width
        border.color: "black"
        color : "turquoise"
        anchors.centerIn: parent
        // anchors.horizontalCenter: parent.horizontalCenter
        // anchors.verticalCenter: parent.verticalCenter

        Grid {
         columns: 3
         // spacing: 10
         // rowSpacing: 10
         // columnSpacing: 10
         LayoutMirroring.enabled: false
         LayoutMirroring.childrenInherit: false
         Rectangle {
             id: topLeftRectId
            width: 100
            height : width
            color: "magenta"
            Image {
                anchors.centerIn: parent
                width: 50
                height: 50
                source: "qrc:/Images/mobile-phone.png"
            }
         }
         Rectangle {
             id: topCenterRectId
            width: 100
            height : width
            color: "pink"
         }
         Rectangle {
             id: topRightRectId
            width: 100
            height : width
            color: "hotpink"
         }
         Rectangle {
            id: midLeftRectId
            width: 100
            height : width
            color: "purple"

         }
         Rectangle {
            id: midCenterRectId
            width: 100
            height : width
            color: "deeppink"

         }
         Rectangle {
            id: midRightRectId
            width: 100
            height : width
            color: "yellow"
         }
         Rectangle {
            id: bottomLeftRectId
            width: 100
            height : width
            color: "palevioletred"
         }
         Rectangle {
            id: bottomCenterRectId
            width: 100
            height : width
            color: "plum"

         }
         Rectangle {
            id: bottomRightRectId
            width: 100
            height : width
            color: "springgreen"
         }
       }
    }
}
