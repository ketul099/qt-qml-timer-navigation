import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    visible: true
    width: 1024
    height: 768
    title: "Qt Timer Application"

    minimumWidth: 1024
    minimumHeight: 768
    maximumWidth: 1024
    maximumHeight: 768

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            color: "#34495e"

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                spacing: 10

                Button {
                    text: "← Back"
                    visible: stackView.depth > 1
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 40

                    onClicked: if (stackView.depth > 1) stackView.pop()
                }

                Item { Layout.fillWidth: true }

                RowLayout {
                    spacing: 12
                    Repeater {
                        model: ["a", "b", "c"]
                        Button {
                            text: modelData
                            Layout.preferredWidth: 50
                            Layout.preferredHeight: 40
                            onClicked: console.log("Button", modelData, "clicked")
                        }
                    }
                }

                Item { Layout.fillWidth: true }
            }
        }

        StackView {
            id: stackView
            Layout.fillWidth: true
            Layout.fillHeight: true

            initialItem: MenuScreen {
                onNavigateToScreen1: stackView.push("Screen1.qml")
            }
        }
    }
}
