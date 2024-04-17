import QtQuick 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Universal 2.15
import Qt.labs.settings 1.1
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.15


Rectangle {
    id: firstRectId
    width: 800
    height: 950
    color: "transparent"
    radius: 20


    SwipeView {
        id: view
        currentIndex: 1
        anchors.fill: parent
        spacing: 40
        Item {
            id: firstPage
            Login{
                anchors.centerIn: parent
            }
        }
        Item {
            id: secondPage
            Login2 {
                anchors.centerIn: parent
            }
        }
    }

    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
