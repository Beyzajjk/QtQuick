import QtQuick 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Universal 2.15
import Qt.labs.settings 1.1
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.15

Rectangle {
    id: colum2Id
    anchors.centerIn: parent
    color: "transparent"
    radius: 20

    property var column1Questions: [firstRadioButton, secRadioButton, thirdRadioButton, fourRadioButton]
    property var column2Questions: [first1RadioButton, sec2RadioButton, third3RadioButton, four4RadioButton]
    property var column3Questions: [first3RadioButton, sec3RadioButton, third4RadioButton, four5RadioButton]
    property bool  hasBeenCalled : false;

    Column {
        spacing: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: questiontext1
            text: "     What generally your top skin concern?"
            font.pointSize: 13
            FontLoader { id: webFont; source: "qrc:/Font/Montserrat-VariableFont_wght.ttf" }
            font.family: webFont.name
            color: darkModeSwitch.checked ? colorWhite : colorBlack
        }

        Column {
            spacing: 10

            RadioButton {
                id: firstRadioButton
                text: "Dryness or irritation."
                font.family: webFont.name
                width: 500
                font.pixelSize:13
            }

            RadioButton {
                id: secRadioButton
                text: "Blackheads or acne."
                font.family: webFont.name
                width: 500
                font.pixelSize:13
            }

            RadioButton {
                id: thirdRadioButton
                text: "T-zone shine or unevenness."
                font.family: webFont.name
                width: 500
                font.pixelSize:13
            }

            RadioButton {
                id: fourRadioButton
                text: "Fine lines or wrinkles."
                font.family: webFont.name
                width: 500
                font.pixelSize:13
            }

            Text {
                id: questiontext2
                text: "     What do your current favorite skin care products do?"
                font.pointSize: 13
                font.family: webFont.name
                width: 500
                color: darkModeSwitch.checked ? colorWhite : colorBlack
            }

            Column {
                spacing: 10

                RadioButton {
                    id: first1RadioButton
                    text: "Provide the right amount of plump and glow."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                }

                RadioButton {
                    id: sec2RadioButton
                    text: "Balance my complexion."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                }

                RadioButton {
                    id: third3RadioButton
                    text: "Relieve tightness or irritation."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                }

                RadioButton {
                    id: four4RadioButton
                    text: "Clear and prevent breakouts."
                    font.family: webFont.name
                    width: 700
                    font.pixelSize:13
                }
            }
            Text {
                id: questiontext3
                text: "     How do you describe your pores? "
                font.pointSize: 13
                font.family: webFont.name
                width: 500
                color: darkModeSwitch.checked ? colorWhite : colorBlack
            }
            Column {
                spacing: 10

                RadioButton {
                    id: first3RadioButton
                    text: "Visible,large,and sometimes clogged."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                }

                RadioButton {
                    id: sec3RadioButton
                    text: "Depends on where ther are on my face."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                }

                RadioButton {
                    id: third4RadioButton
                    text: "Small to meduim-sized."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                }

                RadioButton {
                    id: four5RadioButton
                    text: "They seem to change with the day."
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
                            poll_organizer.sendSelectedOption(selectedOption1, questiontext1.text, 2);

                        if (selectedOption2 !== "")
                            poll_organizer.sendSelectedOption(selectedOption2, questiontext2.text, 2);

                        if (selectedOption3 !== "")
                            poll_organizer.sendSelectedOption(selectedOption3, questiontext3.text, 2);
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
            id: loginImageId
            source: "qrc:/Images/next.png"
        }
        Image {
            x: 550 ; y: 700
            width: 50
            height: 50
            id: loginImage2Id
            source: "qrc:/Images/next - Kopya.png"
        }

    }
}
