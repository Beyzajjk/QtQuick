import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Text Edit")

    Flickable {
        id: flickableId

        width : textInputId.width
        contentHeight: textInputId.implicitHeight
        height: 300
        clip: true
        anchors.centerIn: parent

        TextEdit {
            id: textInputId
            width: 450




            text: "<b>Hello</b> <i>There!</i>" +
                  "\n i just want you to know that you are <font color = 'purple' >intellegent. </font>" +
                  "Even we are tired, sad mostly time." +
                  "in the future, you are going to be a good Programmer" +
                  "\n ,you will have everything you wanted, a good life with" +
                  " perfect husband, happy family, a good job, a good house with" +
                  " \n nice decor, you will have children, laughters, <i> happiness </i>, everything that you need" +
                  " , you will have, <strong> because you can do it if you want to! </strong>"

            wrapMode: TextEdit.Wrap
            textFormat: TextEdit.RichText
            font.family: "Helvetica"
            font.pointSize: 20
            color: "plum"
            focus: true
        }
    }

}
