import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15


Rectangle {
    id: header1
    width: parent.width
    height: 50
    radius: 15
    color: "transparent"
    FontLoader { id: webFont; source: "qrc:/Font/Montserrat-VariableFont_wght.ttf" }
    Text {
        text: "The Importance Of Skin Care"
        color: darkModeSwitch.checked ? colorWhite : colorBlack
        font.pointSize: 30
        anchors.centerIn: parent
        font.family: webFont.name
    }
}
