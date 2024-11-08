import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.0
import Cpp_Elements 1.0

Item {
    id: openFileView

    CarregaArquivo {
        id: carregaArquivo
    }

    FileDialog {
        id: fileDialog
        title: "Escolha um arquivo"
        folder: shortcuts.home

        onAccepted: {
            carregaArquivo.readFile(fileDialog.fileUrl)
        }
    }

    Column {
        spacing: 30
        width: parent.width

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        ScrollView {
            id: scrollView
            width: parent.width * 0.8
            height: 240
            anchors.horizontalCenter: parent.horizontalCenter

            background: Rectangle{
                color: "light gray"
            }

            TextArea {
                text: carregaArquivo.fileText
                readOnly: true
            }
        }

        Button {
            id: bt01

            height: 50
            width: 200
            anchors.horizontalCenter: parent.horizontalCenter

            background: Rectangle {
                color: parent.hovered ? "gray" : "light gray"
            }

            text: (carregaArquivo.fileText.length === 0) ? "Abrir Arquivo" : "Mudar Arquivo"
            onClicked: {
                fileDialog.open()
            }
        }

        Button {
            id: bt02

            height: 50
            width: 200
            anchors.horizontalCenter: parent.horizontalCenter


            background: Rectangle {
                color: parent.hovered ? "gray" : "light gray"
            }

            text: "Voltar"
            onClicked: {
                carregaArquivo.clear()
                myStackView.pop()
            }
        }
    }
}
