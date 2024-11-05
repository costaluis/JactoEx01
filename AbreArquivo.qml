import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.0


Item {
    id: openFileView

    FileDialog {
        id: fileDialog
        title: "Escolha um arquivo"
        folder: shortcuts.home

        onAccepted: {
            console.log("You choose: " + fileDialog.fileUrls)
        }

        onRejected: {
            console.log("Canceled")
        }
    }

    Column {

        spacing: 30

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        Button {
            id: bt01

            height: 50
            width: 200

            background: Rectangle {
                color: parent.hovered ? "light blue" : "light gray"
            }

            text: "Abrir Arquivo"
            onClicked: {
                fileDialog.open()
            }

        }


        Button {
            id: bt02

            height: 50
            width: 200

            background: Rectangle {
                color: parent.hovered ? "gray" : "light gray"
            }

            text: "Voltar"
            onClicked: myStackView.pop()

        }
    }

}
