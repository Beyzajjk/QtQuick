import QtQuick 2.15

Rectangle {
    width: animation.width; height: animation.height + 8
    color: "transparent"
    AnimatedImage {
        id: animation;
        x: 30 ; y: 30
        source: darkMode ? "qrc:/Images/adress2.gif" : "qrc:/Images/adress1.gif" }
    Rectangle {
        property int frames: animation.frameCount
        anchors.centerIn: parent
        width: 4; height: 8
        x: (animation.width - width) * animation.currentFrame / frames
        y: animation.height
        color: "transparent"
    }
}
