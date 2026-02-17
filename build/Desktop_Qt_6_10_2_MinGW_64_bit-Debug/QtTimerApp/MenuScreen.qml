import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: menuScreen
    anchors.fill: parent

    signal navigateToScreen1()

    Rectangle {
        anchors.fill: parent
        color: "#ecf0f1"

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 30

            Text {
                text: "Menu Screen"
                font.pixelSize: 28
                font.bold: true
                Layout.alignment: Qt.AlignHCenter
            }

            GridLayout {
                columns: 5
                rowSpacing: 20
                columnSpacing: 20
                Layout.alignment: Qt.AlignHCenter

                Repeater {
                    model: 10
                    Button {
                        text: (index + 1).toString()
                        Layout.preferredWidth: 140
                        Layout.preferredHeight: 140

                        onClicked: {
                            if (index === 0) menuScreen.navigateToScreen1()
                            else console.log("Button", index + 1, "clicked")
                        }
                    }
                }
            }
        }
    }
}
