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
    anchors.fill: parent
    color: "transparent"
    radius: 20

    property var column1Questions: [firstRadioButton, secRadioButton, thirdRadioButton, fourRadioButton]
    property var column2Questions: [first1RadioButton, sec2RadioButton, third3RadioButton, four4RadioButton]
    property var column3Questions: [first3RadioButton, sec3RadioButton, third4RadioButton, four5RadioButton]
    property bool  hasBeenCalled : false;


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
    Column {
        spacing: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id:questiontext1
            text: "   What does your skin typically look like at the end of the day?"
            font.pointSize: 13
            FontLoader { id: webFont; source: "qrc:/Font/Montserrat-VariableFont_wght.ttf" }
            font.family: webFont.name
            color: darkModeSwitch.checked ? colorWhite : colorBlack
        }

        Column {
            spacing: 10

            RadioButton {
                id: firstRadioButton
                text: "Shimmery T-zone, but matte cheeks."
                font.family: webFont.name
                width: 500
                font.pixelSize:13
            }

            RadioButton {
                id: secRadioButton
                text: "Slick and shiny."
                font.family: webFont.name
                width: 500
                font.pixelSize:13
            }

            RadioButton {
                id: thirdRadioButton
                text: "Tight or splotchy."
                font.family: webFont.name
                width: 500
                font.pixelSize:13
            }

            RadioButton {
                id: fourRadioButton
                text: "None of the above."
                font.family: webFont.name
                width: 500
                font.pixelSize:13
            }

            Text {
                id:questiontext2
                text: "   If you wash your face and don’t apply any products, how does your skin behave 30 minutes later?"
                font.pointSize: 13
                font.family: webFont.name
                width: 500
                color: darkModeSwitch.checked ? colorWhite : colorBlack
            }

            Column {
                spacing: 10

                RadioButton {
                    id: first1RadioButton
                    text: "It want moisturizer ASAP."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                }

                RadioButton {
                    id: sec2RadioButton
                    text: "It's calm, smooth, and soft."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                }

                RadioButton {
                    id: third3RadioButton
                    text: "Oily, dry and generally uneven."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                }

                RadioButton {
                    id: four4RadioButton
                    text: "It's already shiny."
                    font.family: webFont.name
                    width: 700
                    font.pixelSize:13
                }
            }
            Text {
                id: questiontext3
                text: " Dab a blotting paper or tissue on each part of your face, then hold it to the light. What do you see? "
                font.pointSize: 13
                font.family: webFont.name
                width: 500
                color: darkModeSwitch.checked ? colorWhite : colorBlack
            }
            Column {
                spacing: 10

                RadioButton {
                    id: first3RadioButton
                    text: "Oily spots."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                    onClicked: {
                            console.log("Datas has been sent")
                         callOnce(hasBeenCalled);
                            hasBeenCalled = true;
                }
                }

                RadioButton {
                    id: sec3RadioButton
                    text: "Minor oil slicks from my nose and forehead."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                    onClicked: {
                           console.log("Datas has been sent")
                           callOnce(hasBeenCalled);
                           hasBeenCalled = true;
                    }
                }

                RadioButton {
                    id: third4RadioButton
                    text: "Nothing, but my skin is irritated from blotting."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                    onClicked: {
                            console.log("Datas has been sent")

                            callOnce(hasBeenCalled);
                           hasBeenCalled = true;
                    }
                }

                RadioButton {
                    id: four5RadioButton
                    text: "None of the above."
                    font.family: webFont.name
                    width: 500
                    font.pixelSize:13
                    onClicked: {
                            console.log("Datas has been sent")
                           callOnce(hasBeenCalled);
                           hasBeenCalled = true;
                    }
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

    }
}
