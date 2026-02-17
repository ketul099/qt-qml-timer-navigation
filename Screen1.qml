// Core visual module
import QtQuick

// Provides UI controls like Button, Label, TextField, GroupBox
import QtQuick.Controls

// Provides layout managers like ColumnLayout and GridLayout
import QtQuick.Layouts


// Root item of Screen1
// Loaded inside StackView from Main.qml
Item {
    id: screen1
    anchors.fill: parent     // Take full available screen area


    // Background of Screen1
    Rectangle {
        anchors.fill: parent
        color: "#ecf0f1"     // Light grey background


        // Vertical layout for title + GroupBox
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 40   // Space around content
            spacing: 25


            // -------------------------
            // SCREEN TITLE
            // -------------------------
            Text {
                text: "Screen 1"
                font.pixelSize: 28
                font.bold: true

                // Center title horizontally
                Layout.alignment: Qt.AlignHCenter
            }


            // -------------------------
            // GROUP BOX CONTAINER
            // -------------------------
            GroupBox {
                title: "GroupBox title"

                // Center the GroupBox
                Layout.alignment: Qt.AlignHCenter

                // Fixed width for clean layout
                Layout.preferredWidth: 750


                // GridLayout used for form structure
                // 2 columns → Left = Labels, Right = TextFields
                GridLayout {
                    id: grid
                    columns: 2
                    columnSpacing: 200
                    rowSpacing: 10

                    Layout.fillWidth: true
                    Layout.margins: 25


                    // ========================================
                    // ROW 1: Title1 + Field1 (Timer Display)
                    // ========================================
                    Label {
                        text: "title1 (Label)"
                        font.bold: true

                        // Center label text inside column
                        horizontalAlignment: Text.AlignHCenter
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: field1

                        // Bind to C++ backend property
                        // Updates automatically every second
                        text: timerBackend.seconds.toString()

                        readOnly: true
                        Layout.fillWidth: true
                    }


                    // ========================================
                    // ROW 2: Title2 + Field2
                    // ========================================
                    Label {
                        text: "title2 (Label)"
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: field2
                        placeholderText: "Field2 (LineEdit)"
                        Layout.fillWidth: true
                    }


                    // Small spacer between fields and buttons
                    Item {
                        Layout.columnSpan: 2
                        Layout.preferredHeight: 10
                    }


                    // ========================================
                    // BUTTON 1: Start / Pause (Checkable)
                    // ========================================
                    Button {
                        id: btn1
                        text: "Btn1 (Button)"

                        // Makes button toggleable
                        checkable: true

                        // Sync button state with backend
                        checked: timerBackend.running

                        // Span across both columns (centered)
                        Layout.columnSpan: 2
                        Layout.alignment: Qt.AlignHCenter
                        Layout.preferredWidth: 260

                        // When toggled:
                        // checked = true → start timer
                        // checked = false → pause timer
                        onToggled: {
                            checked ? timerBackend.start()
                                    : timerBackend.pause()
                        }
                    }


                    // ========================================
                    // BUTTON 2: Reset Timer
                    // ========================================
                    Button {
                        id: btn2
                        text: "Btn2 (Button)"

                        Layout.columnSpan: 2
                        Layout.alignment: Qt.AlignHCenter
                        Layout.preferredWidth: 260

                        // Reset timer to zero
                        onClicked: timerBackend.reset()
                    }


                    // Spacer before last row
                    Item {
                        Layout.columnSpan: 2
                        Layout.preferredHeight: 10
                    }


                    // ========================================
                    // ROW 3: Title4 + Field4
                    // ========================================
                    Label {
                        text: "title4 (Label)"
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: field4
                        placeholderText: "Field4 (LineEdit)"
                        Layout.fillWidth: true
                    }
                }
            }

            // Push everything upward slightly
            Item { Layout.fillHeight: true }
        }
    }
}
