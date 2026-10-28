import QtQuick
import QtQuick.Controls

Page{
    Column{
        anchors.centerIn: parent
        spacing: 20
        Text{
            text:"Giriş başarılı. Farklı bir qml dosyasındasın."
            font.pixelSize: 18
            font.bold:true
            color: "green"


        }
        Button{
            text:"çıkış yap"
            onClicked: {
                // Kendi içinde StackView tanımlı olmadığı için,
                                // onu çağıran ana StackView'a ulaşıp pop() işlemi yapıyoruz
                                stackView.pop()
            }
        }
    }
}
