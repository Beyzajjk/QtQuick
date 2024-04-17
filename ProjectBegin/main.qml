import QtQuick 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Universal 2.15
import Qt.labs.settings 1.1
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.15


ApplicationWindow {
    id: windowId
    width: 950
    height: 950
    visible: true
    color: "#f2f2f2"
    title: qsTr("Skin Form")
    property bool darkMode: false
    property string colorWhite: "#ffffff"
    property string colorBlack: "#000000"
    Rectangle {
        id: darkModeRect
        anchors.fill: parent
        color: darkMode ? "#212121" : "#f2f2f2" // Dark and light mode background color

        Switch {
            id: darkModeSwitch
            Text {
                text: "Dark Mode"
                anchors.bottom: parent.top
                color: darkModeSwitch.checked ? colorWhite : colorBlack
            }

            anchors.right: parent.right
            anchors.top:parent.top
            anchors.margins: 20
            checked: darkMode
            onClicked: darkMode = !darkMode
        }



        StackView {
            id: firstStackId
            width: parent.width * 100 / 95
            height: parent.height * 100 / 98
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            initialItem: HomePage {
                //        anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    footer: TabBar {
        id: mTabBar
        width: parent.width
        TabButton {
            text: qsTr("Home Page")
            onClicked: {
                firstStackId.pop ()
                firstStackId.push("qrc:/HomePage.qml")
            }
        }
        TabButton {
            text: qsTr("Sign Up")
            onClicked: {
                firstStackId.pop ()
                firstStackId.push("qrc:/Page1.qml")
            }
        }
        TabButton {
            text: qsTr("Questionnaire")
            onClicked: {
                firstStackId.pop ()
                firstStackId.push("qrc:/Page2.qml")
            }
        }
    }
    menuBar: MenuBar {
        background: Rectangle{
            anchors.fill: parent
            color: "transparent"
        }
        Menu {
            title: qsTr("&Options")
            Action {
                id: newActionId
                text: qsTr ("&Information..")
                icon.source: "qrc:/Images/typing.png"
                onTriggered: {  /*information.openInformationPage();*/
                firstStackId.push("qrc:/Message1.qml")}
            }
            Action {
                text: qsTr("&Magazine..")
                id: secActionId
                icon.source: "qrc:/Images/note.png"
                onTriggered: { console.log("Clicked on Magazine")
                firstStackId.push("qrc:/Survey.qml")}
            }
            Action {
                text: qsTr("&Products..")
                id: thirdActionId
                icon.source: "qrc:/Images/pixel.png"
                onTriggered: {
                    console.log("Clicked on Products")
                    firstStackId.push("qrc:/Products.qml")
                }

            }
            Action {
                text: qsTr("&Feed Back..")
                id: fourActionId
                icon.source: "qrc:/Images/edit-button.png"
                onTriggered: { console.log("Clicked on Feed Back")
                     firstStackId.push("qrc:/Feedback.qml")
                }

            }
            MenuSeparator {}
            Action {
                text: qsTr("&Quit..")
                id: fiveActionId
                icon.source: "qrc:/Images/maximize.png"
                onTriggered: { Qt.quit ()
                }
            }


        }
        Menu {
            title: qsTr ("&About..")
            Action {
                id: newMenu1Id
                icon.source: "qrc:/Images/help.png"
                text: qsTr ("&Who Are We..")
            }
            Action {
                id: expMenu2Id
                icon.source: "qrc:/Images/skincare.png"
                text: qsTr ("&Our Vision..")
            }
            MenuSeparator { }
            Menu {
                title: "Communication.."
                Action {
                    id: new7Menu4Id
                    icon.source: "qrc:/Images/call-button.png"
                    text: qsTr ("&Phone")
                    onTriggered: { console.log("Clicked on Communication")
                        firstStackId.push("qrc:/Message2.qml")
                    }

                }
                Action {
                    id: new8Menu4Id
                    icon.source: "qrc:/Images/www.png"
                    text: qsTr ("&Location")
                    onTriggered: { console.log("Clicked on Location")
                        firstStackId.push("qrc:/Message3.qml")
                    }
                }
            }
        }

    }

}

