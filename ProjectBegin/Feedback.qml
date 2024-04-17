import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.15
Rectangle {
    visible: true
    width: 1000
    height: 950
    color: "#f2f2f2"

    Rectangle {
        anchors.centerIn: parent
        width: 400
        height: 600
        color: "#f2f2f2"
        radius: 20

      AnimatedImage {
          id: animation2 ; source: "qrc:/Images/gif1.gif"
          width: 160 ; height: 150
          x: 100 ; y:30
      }

        Column {
            spacing: 20
            anchors.centerIn: parent
            Text {
                text: "         Please give us a Feedback"
                font.bold: true
                font.pixelSize: 15
            }
            Text {
                text: "Do you have any thoughts you'd like to share?"
                font.pixelSize: 15
            }
            TextField {
                id: feedbackInput
                placeholderText: "Write here..."
                width: parent.width
                height: 100
                focus: true
                wrapMode: Text.Wrap
                font.pointSize: 10

            }
            RowLayout {
                spacing: 40
                anchors.horizontalCenter: parent.horizontalCenter
                Button {
                    text: "Enter"
                    width: parent.width * 0.3
                    height: 40
                    onClicked: {
                        var feedbackText = feedbackInput.text;
                        // Geri bildirimi işlemek için burada başka bir fonksiyon çağırabilirsiniz
                        console.log("Feed Back: ", feedbackText);
                        feedbackInput.text = ""; // Girdiyi temizle
                    }
                }
                Button {
                    text: "Cancel"
                    width: parent.width * 0.3
                    height: 40
                    onClicked: {
                        var feedbackText = feedbackInput.text;
                        console.log("Feed back cancelled. ", feedbackText);
                        feedbackInput.text = "";
                    }
                }
            }

        }

    }

}
