// Import core Qt Quick module (basic visual elements)
import QtQuick

// Import ready-made UI controls like Button, ApplicationWindow, etc.
import QtQuick.Controls

// Import layout system (ColumnLayout, RowLayout, GridLayout)
import QtQuick.Layouts


// Root window of the application
ApplicationWindow {
    id: root                      // ID used internally if needed
    visible: true                 // Makes window visible when app starts
    width: 1024                   // Fixed width
    height: 768                   // Fixed height
    title: "Qt Timer Application" // Window title (top bar)

    // Lock window size (cannot resize)
    minimumWidth: 1024
    minimumHeight: 768
    maximumWidth: 1024
    maximumHeight: 768


    // Main vertical layout of the window
    // Everything is stacked vertically: MenuBar on top + StackView below
    ColumnLayout {
        anchors.fill: parent      // Fill entire window
        spacing: 0                // No gap between top bar and content


        // =========================
        // TOP MENU BAR (Always visible)
        // =========================
        Rectangle {
            Layout.fillWidth: true           // Stretch horizontally
            Layout.preferredHeight: 60       // Fixed height
            color: "#34495e"                 // Dark blue background

            // Horizontal layout inside the top bar
            RowLayout {
                anchors.fill: parent         // Fill the rectangle
                anchors.leftMargin: 15       // Padding from left
                anchors.rightMargin: 15      // Padding from right
                spacing: 10                  // Space between elements


                // -------------------------
                // BACK BUTTON
                // -------------------------
                Button {
                    text: "← Back"                   // Button label

                    // Only visible when we are NOT on the first screen
                    visible: stackView.depth > 1

                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 40

                    // When clicked → go back one screen
                    onClicked: {
                        if (stackView.depth > 1)
                            stackView.pop()
                    }
                }


                // Spacer pushes center buttons to middle
                Item { Layout.fillWidth: true }


                // -------------------------
                // CENTER BUTTONS (a, b, c)
                // -------------------------
                RowLayout {
                    spacing: 12

                    // Repeater automatically creates 3 buttons
                    Repeater {
                        model: ["a", "b", "c"]

                        Button {
                            text: modelData        // modelData = "a" / "b" / "c"
                            Layout.preferredWidth: 50
                            Layout.preferredHeight: 40

                            // Just prints message in console
                            onClicked: {
                                console.log("Button", modelData, "clicked")
                            }
                        }
                    }
                }


                // Spacer pushes center buttons perfectly centered
                Item { Layout.fillWidth: true }
            }
        }


        // =========================
        // STACKVIEW (Navigation Area)
        // =========================
        StackView {
            id: stackView

            Layout.fillWidth: true
            Layout.fillHeight: true

            // First screen loaded when app starts
            initialItem: MenuScreen {

                // Custom signal from MenuScreen
                // When button 1 clicked → navigate to Screen1
                onNavigateToScreen1: {
                    stackView.push("Screen1.qml")
                }
            }
        }
    }
}
