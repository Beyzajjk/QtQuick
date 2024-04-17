import QtQuick 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Universal 2.15
import Qt.labs.settings 1.1
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.15


Rectangle {
    anchors.horizontalCenter: parent.horizontalCenter
    width: 500
    height: 500
    color: "transparent"
    radius: 20
    Column {
        spacing: 10

        Text {
            text: "✨Let us know you! ✨"
            font.pixelSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
            FontLoader { id: webFont; source: "qrc:/Font/Montserrat-VariableFont_wght.ttf" }
            font.family: webFont.name
            color: darkModeSwitch.checked ? colorWhite : colorBlack
        }

        TextField {
            id: nameField
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "Your Name" ; placeholderTextColor: "black"
            width: 200
            font.family: webFont.name
            color: darkModeSwitch.checked ? colorWhite : colorBlack
        }

        TextField {
            id: ageField
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "Your Age" ; placeholderTextColor: "black"
            width: 200
            font.family: webFont.name
            color: darkModeSwitch.checked ? colorWhite : colorBlack
            validator: IntValidator {
                bottom: 1
            }
        }
        Text {
            text: "Country"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 15
            font.family: webFont.name
            color: darkModeSwitch.checked ? colorWhite : colorBlack
        }

        TextField {
            id: fromField
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "Nationality" ; placeholderTextColor: "black"
            width: 200
            font.family: webFont.name
            color: darkModeSwitch.checked ? colorWhite : colorBlack
        }

        Text {
            text: "Gender"
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: webFont.name
            color: darkModeSwitch.checked ? colorWhite : colorBlack
            font.pixelSize:15
        }

        Row {
            spacing: 60
            anchors.horizontalCenter: parent.horizontalCenter

            RadioButton {
                id: maleRadioButton
                Text {
                    anchors.verticalCenter: maleRadioButton.verticalCenter
                    anchors.horizontalCenter: maleRadioButton.horizontalCenter
                    text: "Male"
                    color: darkModeSwitch.checked ? colorWhite : colorBlack
                    font.family: webFont.name
                    width: 100
                    font.pixelSize:13
                }
            }

            RadioButton {
                id: femaleRadioButton
                Text {
                    anchors.verticalCenter: femaleRadioButton.verticalCenter
                    anchors.horizontalCenter: femaleRadioButton.horizontalCenter
                    text: "Female"
                    color: darkModeSwitch.checked ? colorWhite : colorBlack
                    font.family: webFont.name
                    width: 150
                    font.pixelSize:13
                }
            }
        }

        Button {
            id: buttonId
            x: 50
            y: 100
            text: "Enter"
            font.family: webFont.name
            onClicked: {
                console.log("Datas has been sent")
                waitingText.text = "Saving.."
                timer.running = true
                function check_gender(){

                    if(maleRadioButton.checked){
                        return "Male"
                    } else {
                       return "Female"
                    }
                }
                var name = nameField.text
                var age = ageField.text
                var country = fromField.text


                poll_organizer.loginInformation(name, age, country, check_gender())
            }
            BusyIndicator {
                width: 50
                height: 50
                running: timer.running
                x: 90 ; y: 60
            }

            Text {
                id: waitingText
                text: ""
                x : 30 ; y: 80
                font.pixelSize: 15
                font.family: webFont.name
                color: darkModeSwitch.checked ? colorWhite : colorBlack
            }
            Timer {
                id: timer
                interval: 2200
                running: false
                onTriggered: {
                    waitingText.text = ""
                }
            }
        }
    }

    Image {
        x: 650 ; y: 820
        width: 50
        height: 50
        id: loginImageId
        source: "qrc:/Images/next.png"
    }
}

