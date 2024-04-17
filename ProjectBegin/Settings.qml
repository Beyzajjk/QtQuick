import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 400
    height: 300

    Rectangle {
        id: content
        width: parent.width * 0.8
        height: parent.height
        color: "lightgray"
        anchors.left: parent.left
        visible: false

        // icerik burada olacak
        Text {
            anchors.centerIn: parent
            text: "Drawer İçeriği"
            font.pixelSize: 20
        }
    }

    Item {
        width: parent.width * 0.2
        height: parent.height
        anchors.left: parent.left

        MouseArea {
            anchors.fill: parent
            onClicked: content.visible = !content.visible
        }

        Rectangle {
            anchors.fill: parent
            color: "gray"
            Text {
                anchors.centerIn: parent
                text: "Aç/Kapat"
                font.pixelSize: 20
            }
        }
    }
}
