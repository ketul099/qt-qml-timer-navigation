// Core Qt Quick module (basic visual elements)
import QtQuick

// UI Controls like Button, Text, etc.
import QtQuick.Controls

// Layout system (ColumnLayout, GridLayout, etc.)
import QtQuick.Layouts


// Root container for this screen
// Using Item because this file is loaded inside StackView
Item {
    id: menuScreen
    anchors.fill: parent    // Fill entire available screen area

    // Custom signal
    // This is emitted when button "1" is clicked
    // Main.qml listens to this and navigates to Screen1
    signal navigateToScreen1()


    // Background rectangle for the whole screen
    Rectangle {
        anchors.fill: parent
        color: "#ecf0f1"     // Light grey background


        // Vertical layout to place title + grid
        ColumnLayout {
            anchors.centerIn: parent   // Center everything vertically + horizontally
            spacing: 30                // Space between title and grid


            // -------------------------
            // SCREEN TITLE
            // -------------------------
            Text {
                text: "Menu Screen"
                font.pixelSize: 28
                font.bold: true

                // Align title horizontally in layout
                Layout.alignment: Qt.AlignHCenter
            }


            // -------------------------
            // GRID OF BUTTONS (1–10)
            // -------------------------
            GridLayout {
                columns: 5              // 5 buttons per row (1–5, 6–10)
                rowSpacing: 20
                columnSpacing: 20

                // Center grid inside ColumnLayout
                Layout.alignment: Qt.AlignHCenter


                // Repeater automatically generates buttons
                // model: 10 → creates 10 buttons
                Repeater {
                    model: 10

                    Button {
                        // Button text: 1 to 10
                        text: (index + 1).toString()

                        Layout.preferredWidth: 140
                        Layout.preferredHeight: 140

                        // When button is clicked:
                        onClicked: {

                            // If button 1 (index 0)
                            // Emit navigation signal
                            if (index === 0) {
                                menuScreen.navigateToScreen1()
                            }
                            else {
                                // For other buttons, just log message
                                console.log("Button", index + 1, "clicked")
                            }
                        }
                    }
                }
            }
        }
    }
}
