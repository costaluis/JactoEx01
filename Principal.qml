import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Item {
    id: mainView

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
                color: parent.hovered ? "gray" : "lightgray"
            }

            text: "Abrir Arquivo"
            onClicked: {
                myStackView.push("AbreArquivo.qml")
            }
        }

        Button {
            id: bt02

            height: 50
            width: 200

            background: Rectangle {
                color: parent.hovered ? "gray" : "lightgray"
            }

            text: "Enviar Comando"
            onClicked: myStackView.push("TransmiteComando.qml")
        }

        Button {
            id: bt03

            height: 50
            width: 200

            background: Rectangle {
                color: parent.hovered ? "gray" : "light gray"
            }

            text: "Sair/Encerrar"
            onClicked: Qt.quit()
        }
    }
}
