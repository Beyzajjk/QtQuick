import QtQuick 2.15

Item {

    width: receiverRectId.width
    height: receiverRectId.height
    property alias rectColor: receiverRectId.color

    function receiveInfo (count) {
        recieverDisplayTextId.text = count
        console.log("Receiver received the number: " +count)
    }
       Rectangle {
           id: receiverRectId
           width: 200
           height: 200
           color: "red"

           Text {
               id: recieverDisplayTextId
               anchors.centerIn: parent
               font.pointSize: 12
               text : "0"

           }
       }

}
