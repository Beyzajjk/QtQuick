import QtQuick 2.15


Item {
    id: firstRectTextId
    width : parent.width
    height: parent.height
    Flickable {
        id: flickableId

        width : parent.width
        contentHeight: textInputId.implicitHeight
        height: parent.height
        clip: true
        anchors.centerIn: parent

        Text {
            id: textInputId
            width: parent.width
            text:
            "Home skin care can actually be expressed as skin care that is applied in the morning and evening in the daily routine,"+
            "carried out with easily accessible products and without the need for professional knowledge . In order to be able to do skin care at home , first of all, it is necessary to determine the skin needs correctly and choose the products suitable for the skin type among the products that will meet these needs."+
            "While cleaning and moisturizing the face during the facial care process may seem sufficient at first glance, in fact, the skin care routine is completed with a variety of products that are used both daily and at regular intervals. Especially face masksand serums are among the popular products of skin care routines,"+
            "thanks to their intense effects and the visible change they offer in a short time. In order to create a skin care routine at home without any problems, it is necessary to learn the order of skin care first and then have knowledge about product selection according to skin types."+
            "The products used in a basic skin care routine are according to their order of use;"+
            "It can be listed as: "+
            " <font color = 'hotpink' >Cleanser,Tonic,Serum, Moisturizer, day or night care cream. </font>"+
            "In addition to these, if there are no sunscreen components in the daytime care cream or skin moisturizing cream, the use of sunscreen should be included in the last step by preserving the skin care order, regardless of summer or winter. In addition to these applications, facial masks and peeling products that help to achieve peeling effect can be added to the care routine several times a week."
            wrapMode: Text.Wrap
            textFormat: Text.RichText
            FontLoader { id: webFont; source: "qrc:/Font/Montserrat-VariableFont_wght.ttf" }
            font.pointSize: 16
            font.family: webFont.name
            color: darkModeSwitch.checked ? colorWhite : colorBlack
            focus: true
        }
    }
}

