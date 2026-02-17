import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: screen1
    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        color: "#ecf0f1"

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 40
            spacing: 25

            Text {
                text: "Screen 1"
                font.pixelSize: 28
                font.bold: true
                Layout.alignment: Qt.AlignHCenter
            }

            GroupBox {
                title: "GroupBox title"
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 750

                GridLayout {
                    id: grid
                    columns: 2
                    columnSpacing: 40
                    rowSpacing: 18
                    anchors.margins: 18
                    anchors.fill: parent

                    // ---- Row 1 ----
                    Label {
                        text: "title1 (Label)"
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        Layout.fillWidth: true
                    }
                    TextField {
                        id: field1
                        text: timerBackend.seconds.toString()   // timer value
                        readOnly: true
                        Layout.fillWidth: true
                    }

                    // ---- Row 2 ----
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

                    // ---- Btn1 centered (span 2 columns) ----
                    Item { Layout.columnSpan: 2; Layout.preferredHeight: 10 }

                    Button {
                        id: btn1
                        text: "Btn1 (Button)"
                        checkable: true
                        checked: timerBackend.running
                        Layout.columnSpan: 2
                        Layout.alignment: Qt.AlignHCenter
                        Layout.preferredWidth: 260

                        onToggled: checked ? timerBackend.start() : timerBackend.pause()
                    }

                    // ---- Btn2 centered (span 2 columns) ----
                    Button {
                        id: btn2
                        text: "Btn2 (Button)"
                        Layout.columnSpan: 2
                        Layout.alignment: Qt.AlignHCenter
                        Layout.preferredWidth: 260

                        onClicked: timerBackend.reset()
                    }

                    Item { Layout.columnSpan: 2; Layout.preferredHeight: 10 }

                    // ---- Last row ----
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

            Item { Layout.fillHeight: true }
        }
    }
}
