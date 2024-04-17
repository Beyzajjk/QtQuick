import QtQuick 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Dialogs 1.3

Rectangle {
    id: page2RectId
    width: 800
    height: 950
    color: "transparent"
    radius: 20


    SwipeView {
        id: viewId
        currentIndex: 1
        anchors.fill: parent
        spacing: 40
        Item {
            id: firstPage
            Poll1 {
                anchors.fill: parent
            }
        }
        Item {
            id: secondPage
            Poll2 {
                anchors.fill: parent
            }
        }
    }

    PageIndicator {
        id: indicator

        count: viewId.count
        currentIndex: viewId.currentIndex

        anchors.bottom: viewId.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
