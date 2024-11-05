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

            text: "Abrir Arquivo"
            onClicked: {
                myStackView.push("AbreArquivo.qml")
            }
        }

        Button {
            id: bt02

            height: 50
            width: 200

            text: "Enviar Comando"
            onClicked: myStackView.push(mainView)
        }

        Button {
            id: bt03

            height: 50
            width: 200

            background: Rectangle {
                color: parent.hovered ? "red" : "light gray"
            }

            text: "Sair/Encerrar"
            onClicked: Qt.quit()
        }
    }
}
