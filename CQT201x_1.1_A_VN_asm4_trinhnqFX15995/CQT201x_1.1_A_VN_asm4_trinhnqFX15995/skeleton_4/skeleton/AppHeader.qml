import QtQuick 2.0

Item {
    property bool playlistButtonStatus: false
    property bool vnButtonStatus: false
    signal clickPlaylistButton()
    Image {
        id: headerItem
        source: "qrc:/Image/title.png"
        SwitchButton {
            id: playlist_button
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            icon_off: "qrc:/Image/drawer.png"
            icon_on: "qrc:/Image/back.png"
            onClicked: {
                clickPlaylistButton()
            }
        }
        Text {
            anchors.left: playlist_button.right
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            text: qsTr("STR_PLAYLIST")+translator.updateText
            color: "white"
            font.pixelSize: 32
        }
        Text {
            id: headerTitleText
            text: qsTr("STR_MEDIA_HEADER")+translator.updateText
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 46
        }
        Image {
            id: vn_flag
            anchors.right: parent.right
            anchors.rightMargin: 220
            anchors.verticalCenter: parent.verticalCenter
            width: 50
            height: 50
            source: "qrc:/Image/vn.png"
            Rectangle{
                width: 50
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                border.color: "gray"
                border.width: 3
                color: "transparent"
                visible: vnButtonStatus?true:false
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(vnButtonStatus == false){
                        vnButtonStatus = true
                        translator.selectLanguage("vn")
                    }
                }
            }
        }
        Image {
            id: us_flag
            anchors.right: vn_flag.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            width: 50
            height: 50
            source: "qrc:/Image/us.png"
            Rectangle{
                width: 50
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                border.color: "gray"
                border.width: 3
                color: "transparent"
                visible: vnButtonStatus?false:true
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(vnButtonStatus == true){
                        vnButtonStatus = false
                        translator.selectLanguage("us")
                    }
                }
            }
        }
    }
}
