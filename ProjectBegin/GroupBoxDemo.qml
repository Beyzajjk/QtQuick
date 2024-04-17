import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
Page4 {
    id: page4
    visible: true
    readonly property int buttonWidth: Math.max(page4.availableWidth / 3)

    Column {
        spacing: 20
        anchors.fill: parent


        GroupBox {
            title: "What is your name ☼"
            anchors.horizontalCenter: parent.horizontalCenter
            Column {
                RadioButton {
                    text: "Combination"
                    onCheckedChanged: {
                        if (checked === true) {
                            console.log("Combination is checked")
                        }
                    }
                }
                RadioButton {
                    text: "Dry"
                    onCheckedChanged: {
                        if (checked === true) {
                            console.log("Dry is checked")
                        }
                    }
                }
                RadioButton {
                    text: "Oily"
                    onCheckedChanged: {
                        if (checked === true) {
                            console.log("Oily is checked")
                        }
                    }
                }
                RadioButton {
                    text: "Sensetive"
                    onCheckedChanged: {
                        if (checked === true) {
                            console.log("Sensetive is checked")
                        }
                    }
                }

            }

        }
        GroupBox {
            title: "What is Your Skin-Type?"
            anchors.horizontalCenter: parent.horizontalCenter
            Column {
                CheckBox {
                    text: "Combination"
                    onCheckedChanged: {
                        if (checked === true) {
                            console.log("Combination is checked")
                        }
                    }
                }
                CheckBox {
                    text: "Dry"
                }
                CheckBox {
                    text: "Oily"
                }
                CheckBox {
                    text: "Sensetive"
                }

            }

        }

    }
}
