/***************************************************************************
* Copyright (c) 2013 Abdurrahman AVCI <abdurrahmanavci@gmail.com>
*
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without restriction,
* including without limitation the rights to use, copy, modify, merge,
* publish, distribute, sublicense, and/or sell copies of the Software,
* and to permit persons to whom the Software is furnished to do so,
* subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included
* in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
* OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
* OR OTHER DEALINGS IN THE SOFTWARE.
*
***************************************************************************/

import QtQuick 2.0
import SddmComponents 2.0

Rectangle {
    id: container
    width: 640
    height: 480

    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    property int sessionIndex: session.index

    TextConstants { id: textConstants }

    Connections {
        target: sddm

        function onLoginSucceeded() {
            errorMessage.color = "#45707a"
            errorMessage.text = textConstants.loginSucceeded
        }
        function onLoginFailed() {
            password.text = ""
            errorMessage.color = "#6c782e"
            errorMessage.text = textConstants.loginFailed
        }
        function onInformationMessage(message) {
            errorMessage.color = "#6c782e"
            errorMessage.text = message
        }
    }

    Background {
        anchors.fill: parent
        source: Qt.resolvedUrl(config.background)
        fillMode: Image.PreserveAspectCrop
        onStatusChanged: {
            var defaultBackground = Qt.resolvedUrl(config.defaultBackground)
            if (status == Image.Error && source != defaultBackground) {
                source = defaultBackground
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        Column {
            id: clock
            anchors.margins: 5
            anchors.top: parent.top; anchors.left: parent.left
        
            Text {
                id: dateLabel
                color: "#4f3829"
                font.pointSize: 36
                font.family: "JetBrains Mono"
                text: Qt.formatDate(new Date(), "ddd, MMM dd")

                Timer {
                    interval: 60000
                    running: true
                    repeat: true
                    onTriggered: dateLabel.text = Qt.formatDate(new Date(), "ddd, MMM dd")
                }
            }
        
            Text {
                id: timeLabel
                color: "#4f3829"
                font.pointSize: 36
                font.family: "JetBrains Mono"
                text: Qt.formatTime(new Date(), "hh:mm AP")
            
                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered: timeLabel.text = Qt.formatTime(new Date(), "hh:mm AP")
                }
            }
        }

        Rectangle {
            id: rectangle
            anchors.centerIn: parent
            width: Math.max(320, mainColumn.implicitWidth + 50)
            height: Math.max(320, mainColumn.implicitHeight + 50)
            color: "#f9f5d7"

            Column {
                id: mainColumn
                anchors.centerIn: parent
                spacing: 12

                Column {
                    width: parent.width
                    spacing: 4
                    Text {
                        id: lblName
                        width: parent.width
                        text: textConstants.userName
                        color: "#4f3829"
                        font.bold: true
                        font.pixelSize: 12
                        font.family: "JetBrains Mono"
                    }

                    TextBox {
                        id: name
                        width: parent.width; height: 30
                        text: userModel.lastUser
                        textColor: "#4f3829"
                        borderColor: "#4f3829"
                        focusColor: "#c35e0a"
                        hoverColor: "#c35e0a"
                        color: "#f3eac7"
                        font.pixelSize: 14
                        font.family: "JetBrains Mono"

                        KeyNavigation.backtab: rebootButton; KeyNavigation.tab: password

                        Keys.onPressed: function (event) {
                            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                                sddm.login(name.text, password.text, sessionIndex)
                                event.accepted = true
                            }
                        }
                    }
                }

                Column {
                    width: parent.width
                    spacing : 4
                    Text {
                        id: lblPassword
                        width: parent.width
                        text: textConstants.password
                        color: "#4f3829"
                        font.bold: true
                        font.pixelSize: 12
                        font.family: "JetBrains Mono"
                    }

                    PasswordBox {
                        id: password
                        width: parent.width; height: 30
                        textColor: "#4f3829"
                        borderColor: "#4f3829"
                        focusColor: "#c35e0a"
                        hoverColor: "#c35e0a"
                        color: "#f3eac7"
                        font.pixelSize: 14
                        font.family: "JetBrains Mono"

                        KeyNavigation.backtab: name; KeyNavigation.tab: session

                        Keys.onPressed: function (event) {
                            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                                sddm.login(name.text, password.text, sessionIndex)
                                event.accepted = true
                            }
                        }
                    }
                }

                Row {
                    spacing: 4
                    width: parent.width / 2
                    z: 100

                    Column {
                        z: 100
                        width: parent.width * 1.3
                        spacing : 4
                        anchors.bottom: parent.bottom

                        Text {
                            id: lblSession
                            width: parent.width
                            text: textConstants.session
                            color: "#4f3829"
                            wrapMode: TextEdit.WordWrap
                            font.bold: true
                            font.pixelSize: 12
                            font.family: "JetBrains Mono"
                        }

                        ComboBox {
                            id: session
                            width: parent.width; height: 30
                            textColor: "#4f3829"
                            borderColor: "#4f3829"
                            focusColor: "#c35e0a"
                            hoverColor: "#c35e0a"
                            menuColor: "#f3eac7"
                            color: "#f3eac7"
                            font.pixelSize: 14
                            font.family: "JetBrains Mono"

                            arrowIcon: Qt.resolvedUrl("angle-down.png")
                            arrowColor: "#4f3829"

                            model: sessionModel
                            index: sessionModel.lastIndex

                            KeyNavigation.backtab: password; KeyNavigation.tab: layoutBox
                        }
                    }

                    Column {
                        z: 101
                        width: parent.width * 0.7
                        spacing : 4
                        anchors.bottom: parent.bottom

                        visible: keyboard.enabled && keyboard.layouts.length > 0

                        Text {
                            id: lblLayout
                            width: parent.width
                            text: textConstants.layout
                            wrapMode: TextEdit.WordWrap
                            color: "#4f3829"
                            font.bold: true
                            font.pixelSize: 12
                            font.family: "JetBrains Mono"
                        }

                        LayoutBox {
                            id: layoutBox
                            width: parent.width; height: 30
                            color: "#f3eac7"
                            font.pixelSize: 14
                            font.family: "JetBrains Mono"

                            arrowIcon: Qt.resolvedUrl("angle-down.png")
                            arrowColor: "#4f3829"

                            KeyNavigation.backtab: session; KeyNavigation.tab: loginButton
                        }
                    }
                }

                Column {
                    width: parent.width
                    Text {
                        id: errorMessage
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: textConstants.prompt
                        color: "#4f3829"
                        font.pixelSize: 10
                        font.family: "JetBrains Mono"
                    }
                }

                Row {
                    spacing: 4
                    anchors.horizontalCenter: parent.horizontalCenter
                    property int btnWidth: Math.max(loginButton.implicitWidth,
                                                    shutdownButton.implicitWidth,
                                                    rebootButton.implicitWidth, 80) + 8
                    Button {
                        id: loginButton
                        text: textConstants.login
                        width: parent.btnWidth
                        borderColor: "#292828"
                        textColor: "#4f3829"
                        color: "#f3eac7"
                        activeColor: "#c35e0a"
                        pressedColor: "#c35e0a"

                        onClicked: sddm.login(name.text, password.text, sessionIndex)

                        KeyNavigation.backtab: layoutBox; KeyNavigation.tab: shutdownButton
                    }

                    Button {
                        id: shutdownButton
                        text: textConstants.shutdown
                        width: parent.btnWidth
                        borderColor: "#292828"
                        textColor: "#4f3829"
                        color: "#f3eac7"
                        activeColor: "#c35e0a"
                        pressedColor: "#c35e0a"

                        onClicked: sddm.powerOff()

                        KeyNavigation.backtab: loginButton; KeyNavigation.tab: rebootButton
                    }

                    Button {
                        id: rebootButton
                        text: textConstants.reboot
                        width: parent.btnWidth
                        borderColor: "#292828"
                        textColor: "#4f3829"
                        color: "#f3eac7"
                        activeColor: "#c35e0a"
                        pressedColor: "#c35e0a"

                        onClicked: sddm.reboot()

                        KeyNavigation.backtab: shutdownButton; KeyNavigation.tab: name
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        if (name.text == "")
            name.focus = true
        else
            password.focus = true
    }
}