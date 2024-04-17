import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Signal and Slots2")

    Notifier {
        id: notifierId
        rectColor: "pink"
        target: receiverId
        Component.onCompleted: {
            notify.connect (receiverId.receiveInfo) // Connect signal to a slot
        }
    }
    Receiver {
        id: receiverId
        rectColor: "yellow"
        anchors.right: parent.right

    }
}
