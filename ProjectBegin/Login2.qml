import QtQuick 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Universal 2.15
import Qt.labs.settings 1.1
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.15


Rectangle {
    id: columId
    color: "transparent"
    radius: 20
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    width: parent.width * 100 / 95
    height: parent.height * 100 / 98

    property var column1Questions: [firstRadioButton, secRadioButton, thirdRadioButton, fourRadioButton]
    property var column2Questions: [first1RadioButton, sec2RadioButton, third3RadioButton, four4RadioButton]
    property var column3Questions: [first3RadioButton, sec3RadioButton, third4RadioButton, four5RadioButton]
    property bool  hasBeenCalled : false;

    Column {
        spacing: 10
        anchors.left: columId.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.centerIn: parent

        Text {
            id: questiontext1
            text: "     How many times do you wash your face with a Cleanser in a week?"
            font.pointSize: 15
            FontLoader { id: webFont; source: "qrc:/Font/Montserrat-VariableFont_wght.ttf" }
            font.family: webFont.name
            color: darkModeSwitch.checked ? colorWhite : colorBlack
        }

        Column {
            spacing: 10

            RadioButton {
                id: firstRadioButton
                text: "Not much."
                font.family: webFont.name
                width: 500
                font.pixelSize:13
            }

            RadioButton {
                id: secRadioButton
                text: "3 or 4 times maybe."
                font.family: webFont.name
                width: 500
                font.pixelSize:13
            }

            RadioButton {
                id: thirdRadioButton
                text: "Every morning."
                font.family: webFont.name
                width: 500
                font.pixelSize:13
            }

            RadioButton {
                id: fourRadioButton
                text: "Every morning and every night for a week."
                font.family: webFont.name
                width: 500
                font.pixelSize:13
            }

            Text {
                id: questiontext2
                text: "     Do you use any different products other than Cleanser?"
                font.pointSize: 15
                font.family: webFont.name
                width: 500
                color: darkModeSwitch.checked ? colorWhite : colorBlack
            }

            Column {
                spacing: 10

                RadioButton {
                    id: first1RadioButton
                    text: "Yes i just use Cleansers and Moisturizers"
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                }

                RadioButton {
                    id: sec2RadioButton
                    text: "I don't think its a good idea to use Chemicals for my skin."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                }

                RadioButton {
                    id: third3RadioButton
                    text: "I don't have money enough."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                }

                RadioButton {
                    id: four4RadioButton
                    text: "I do have all products that i need such as Cleanser, Tonic, Serum, Moisturizer and etc."
                    font.family: webFont.name
                    width: 700
                    font.pixelSize:13
                }
            }
            Text {
                id: questiontext3
                text: "     Did you have acnes when you were a Teenager? "
                font.pointSize: 15
                font.family: webFont.name
                width: 500
                color: darkModeSwitch.checked ? colorWhite : colorBlack
            }
            Column {
                spacing: 10

                RadioButton {
                    id: first3RadioButton
                    text: "Not much.I just had acnes on my cheeks."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                }

                RadioButton {
                    id: sec3RadioButton
                    text: "Yes, i had really bad and hard times with my acnes."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                }

                RadioButton {
                    id: third4RadioButton
                    text: "No, i was lucky."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                }

                RadioButton {
                    id: four5RadioButton
                    text: "Yes, so much. I had to go to Dermatologist."
                    font.family: webFont.name
                    width: 500
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


                function findCheckedRadioButton(buttons) {
                    for (var i = 0; i < buttons.length; i++) {
                        if (buttons[i].checked) {
                            return buttons[i].text;
                        }
                    }
                    return ""; //
                }

                function callOnce(hasBeenCalled) {
                    if (!hasBeenCalled) {
                        hasBeenCalled = true;

                        var selectedOption1 = findCheckedRadioButton(column1Questions);
                        var selectedOption2 = findCheckedRadioButton(column2Questions);
                        var selectedOption3 = findCheckedRadioButton(column3Questions);

                        if (selectedOption1 !== "")
                            poll_organizer.sendSelectedOption(selectedOption1, questiontext1.text, 1);

                        if (selectedOption2 !== "")
                            poll_organizer.sendSelectedOption(selectedOption2, questiontext2.text, 1);

                        if (selectedOption3 !== "")
                            poll_organizer.sendSelectedOption(selectedOption3, questiontext3.text, 1);
                    }
                }
                callOnce(hasBeenCalled);
                hasBeenCalled = true;

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
        Image {
            x: 650 ; y: 700
            width: 50
            height: 50
            id: loginImage2Id
            source: "qrc:/Images/next - Kopya.png"
        }
    }

}
