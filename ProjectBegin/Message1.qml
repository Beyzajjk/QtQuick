import QtQuick 2.15



Rectangle {
    width: animation2.width; height: animation2.height + 8
    color: "transparent"
    property bool darkModeMessage: false
    AnimatedImage {
        id: animation2;
        x: 30 ; y: 30
        source: darkMode ? "qrc:/Images/information2.gif" : "qrc:/Images/information.gif" }
    Rectangle {
        property int frames: animation2.frameCount
        anchors.centerIn: parent
        width: 4; height: 8
        x: (animation2.width - width) * animation2.currentFrame / frames
        y: animation2.height
        color: "transparent"
    }
}
