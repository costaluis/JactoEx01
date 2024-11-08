import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.0
import Cpp_Elements 1.0

Item {
    id: sendCommandView

    EnviaComando {
        id: enviaComando
        topic: topicTextArea.text
        msg: msgTextArea.text
    }

    Column {
        spacing: 30
        width: parent.width

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        Column {
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                anchors.left: topicTextArea.left
                text: "Tópico"
            }

            TextArea {
                id: topicTextArea

                width: parent.width * 0.8
                anchors.horizontalCenter: parent.horizontalCenter
                background: Rectangle {
                    color: "light gray"
                }
            }
        }

        Column {
            id: msgColumn

            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                anchors.left: scrollView.left
                text: "Conteúdo"
            }

            ScrollView {
                id: scrollView
                width: parent.width * 0.8
                height: 120
                anchors.horizontalCenter: parent.horizontalCenter

                background: Rectangle{
                    color: "light gray"
                }

                TextArea {
                    id: msgTextArea
                }
            }
        }

        Row {
            width: parent.width * 0.8
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 40

            Button {
                id: bt01

                height: 50
                width: (parent.width - parent.spacing) / 2

                background: Rectangle {
                    color: parent.hovered ? "gray" : "light gray"
                }

                text: "Voltar"
                onClicked: {
                    myStackView.pop()
                }
            }

            Button {
                id: bt02

                height: 50
                width: (parent.width - parent.spacing) / 2

                background: Rectangle {
                    color: parent.hovered ? "gray" : "light gray"
                }

                text: "Enviar"
                onClicked: {
                    enviaComando.sendMessage()
                }
            }
        }
    }
}
