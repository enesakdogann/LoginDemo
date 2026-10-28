import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

ApplicationWindow {
    // uygulama penceresi ayarları
    width: 500
    height: 400
    visible: true
    title: "LoginDemo"

    //  Ekran geçişlerini yönetecek ana StackView objesini oluşturuyoruz.
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: loginPage // Uygulama açıldığında ilk olarak "loginPage" bileşenini göster
    }

    //   "Component" ve "Page" içine alarak paketliyoruz.
    Component {
        id: loginPage

        Page {
            Column { // elemanları alt alta ve ekran ortasına hizalama için
                anchors.centerIn: parent
                spacing: 15

                TextField { // mail alanı
                    id: emailField
                    placeholderText: "E-Posta"
                }

                TextField { // şifre alanı
                    id: passwordField
                    placeholderText: "Şifre"
                    echoMode: TextInput.Password // şifreyi gizler
                }

                Text {
                    id: messageText
                    text: "" // ilk boş bırakıyoruz
                    font.pixelSize: 14
                    font.bold: true
                }

                Button {
                    id: loginButton
                    text: "Giriş"
                    enabled: emailField.text !== "" && passwordField.text !== ""

                    onClicked: { // basit bir if else ile durumu kontrol ediyoruz
                        if (emailField.text === "" || passwordField.text === "") {
                            messageText.text = "Lütfen tüm alanları doldurun"
                            messageText.color = "red"
                        } else {
                            messageText.text = "Hoşgeldin " + emailField.text
                            messageText.color = "green"

                            // Yeni ekrana geçiş komutunu "else" bloğunun içine, yani işlem başarılıysa çalışacak yere aldık.
                            stackView.push("HomePage.qml")
                        }
                    }
                }
            }
        }
    }
}