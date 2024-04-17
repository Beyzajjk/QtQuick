import QtQuick 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Universal 2.15
import Qt.labs.settings 1.1
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.15
import QtQuick.Window 2.15


Window {
    id: calendarId
    width: 500
    height: 500
    visible: false
    color: "#f2f2f2"
    title: qsTr("Calendar")
    Connections {
        target: CppClass
        onSendDateTime:
        {
            console.log(" Today's date: " +datetimeparam);

            // extract info
            console.log("Year: " +datetimeparam.getFullYear())
            console.log("..." ,datetimeparam.toGMTString())

        }
    }
}
