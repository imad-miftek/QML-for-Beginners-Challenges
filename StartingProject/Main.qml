import QtQuick
import QtQuick.Controls 2.15

Window {

    // TODO: change the size to ensure it forms the standard business card ratio of approx 1:1.586
    // HINT: you may wish to use a binding

    width: height * 1.586
    height: 480

    visible: true
    title: qsTr("Business Card")

    component ContactInfo: QtObject {

        // This is a ContactInfo object which provides the properties to fill in.
        // You can create as many instances of this as you like with different property values.

        // show these properties all the time:
        property string name
        property url photo

        // Basic Info properties:
        property string occupation
        property string company

        // Detailed Info properties:
        property string address
        property string country
        property string phone
        property string email
        property url webSite
    }

    ContactInfo {
        id: myContactInfo

        // this is one example instance of a ContactInfo inline Component
        // showing how the properties are populated.

        name: "Imaduddin Sheikh"
        photo: Qt.resolvedUrl("IDPhoto.png")
        occupation: "Software Engineer"
        company: "Miftek Corporation"
        address: "1231 Cumberland Ave., West Lafayette IN, 47906"
        country: "United States of America"
        phone: "+847 262 1436"
        email: "imad@miftek.com"
        webSite: Qt.url("https://www.miftek.com")
    }

    /* Your solution should contain these key features:

        - A Text element for each of the ContactInfo properties.
        - The name and photo image should be shown all the time.
        - These should be grouped into two categories "Basic Info" and "Details".
        - Create a button using a MouseArea or TapHandler that can be used to
          toggle between showing the two categories of information.
        - Use a larger font size for the name
    */

    Rectangle {
        id: card
        color: "#ffffff"
        anchors.fill: parent
        anchors.margins: 20  // This adds 20px spacing on all sides
        radius: 12
        border.color: "#000000"
        border.width: 1

        property bool showDetails: true

        Item {
            id: cardItem
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.topMargin: 20
            anchors.bottomMargin: 20

            Column {
                id: detailsColumn
                x: 0
                y: 0
                width: 0.7 * card.width
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                spacing: 0  // Add spacing control

                Item {
                    id: infoItem
                    height: 0.9 * detailsColumn.height
                    width: parent.width  // Remove anchor, use width instead

                    Text {
                        id: name
                        text: myContactInfo.name
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.rightMargin: 0
                        font.pixelSize: 40
                        font.bold: true
                    }

                    Text {
                        id: occupation
                        color: "#767272"
                        text: myContactInfo.occupation
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: name.bottom
                        anchors.leftMargin: 0
                        anchors.rightMargin: 0
                        anchors.topMargin: 5
                        font.pixelSize: 25
                        font.bold: false
                    }

                    Text {
                        id: company
                        color: "#000000"
                        text: myContactInfo.company
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: occupation.bottom
                        anchors.leftMargin: 0
                        anchors.rightMargin: 0
                        anchors.topMargin: 10
                        font.pixelSize: 21
                        font.weight: Font.DemiBold
                        font.bold: false
                    }

                    Item {
                        id: detailsItem
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: company.bottom
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 0
                        anchors.rightMargin: 0
                        anchors.topMargin: 15
                        anchors.bottomMargin: 0
                        visible: card.showDetails

                        Text {
                            id: country
                            x: 0
                            y: 176
                            color: "#000000"
                            text: "<span style='color: black;'><b>Country:</b></span> <span style='color: #34495e;'>" + myContactInfo.country + "</span>"
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: address.bottom
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0
                            anchors.topMargin: 5
                            font.pixelSize: 15
                            wrapMode: Text.WordWrap
                            textFormat: Text.RichText
                        }

                        Text {
                            id: phone
                            x: 0
                            y: 201
                            text: "<span style='color: black;'><b>Phone:</b></span> <span style='color: #34495e;'>" + myContactInfo.phone + "</span>"
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: country.bottom
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0
                            anchors.topMargin: 5
                            font.pixelSize: 15
                            wrapMode: Text.WordWrap
                            textFormat: Text.RichText
                        }

                        Text {
                            id: email
                            x: 0
                            y: 226
                            text: "<span style='color: black;'><b>Email:</b></span> <span style='color: #34495e;'>" + myContactInfo.email + "</span>"
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: phone.bottom
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0
                            anchors.topMargin: 5
                            font.pixelSize: 15
                            wrapMode: Text.WordWrap
                            textFormat: Text.RichText
                        }

                        Text {
                            id: website
                            x: 0
                            y: 251
                            text: "<span style='color: black;'><b>Website:</b></span> <a href='" + myContactInfo.webSite.toString() + "'>" + myContactInfo.webSite.toString() + "</a>"
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: email.bottom
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0
                            anchors.topMargin: 5
                            font.pixelSize: 15
                            wrapMode: Text.WordWrap
                            textFormat: Text.RichText

                            onLinkActivated: function(link) {
                                Qt.openUrlExternally(link)
                            }
                        }

                        Text {
                            id: address
                            x: 0
                            y: 151
                            height: 20
                            text: "<span style='color: black;'><b>Address:</b></span> <span style='color: #34495e;'>" + myContactInfo.address + "</span>"
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0
                            anchors.topMargin: 0
                            font.pixelSize: 15
                            wrapMode: Text.WordWrap
                            textFormat: Text.RichText
                        }
                    }
                }

                Item {
                    id: buttonItem
                    height: 0.1 * detailsColumn.height
                    width: parent.width  // Remove anchors, use width instead

                    Button {
                        id: toggleButton
                        y: -2
                        width: 120
                        height: 30
                        text: qsTr("Details")
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 0
                        checkable: false
                        font.bold: true
                        display: AbstractButton.TextOnly

                        onClicked: {
                            card.showDetails = !card.showDetails;
                        }
                    }
                }
            }

            Column {
                id: photoColumn
                x: 505
                y: 0
                width: 0.3 * card.width
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0

                Rectangle {
                    id: rectangle
                    width: 150
                    height: 150
                    color: "#ffffff"
                    radius: 5
                    border.width: 2
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    // Remove anchors.right, anchors.top - Column will position this

                    Image {
                        id: image
                        y: 0
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 5
                        anchors.rightMargin: 5
                        anchors.topMargin: 5
                        anchors.bottomMargin: 5
                        source: myContactInfo.photo
                        antialiasing: true
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
        }

        // Main content layout
    }
}
