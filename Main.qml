import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0

import uk.co.piggz.amazfish 1.0

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("libwatchfish notification monitor example")
    id: appwindow

    NotificationMonitor {
        id: notificationMonitor
        onNotification: function(n) {
            history.append({
                "nid": n.id,
                "name": n.appName,
                "summary": n.summary,
                "body": n.body,
                "open": "true",
            });
        }
        onNotificationClosed: function (nid, reason) {
            for (var i = 0; i < history.count; i++) {
                var item = history.get(i)
                if (item.nid === nid) {
                    history.setProperty(i, "open", "false")
                }
            }
        }
    }

    ListModel {
        id: history
        ListElement {
            nid: -1
            name: "appName"
            summary: "summary"
            body: "body"
            open: "open"
        }
    }

    ListView {
        anchors.fill: parent
        model: history
        delegate: Rectangle {
            width: appwindow.width
            height: rowContent.height + 10
            color: mouse.pressed ? "#729fcf" : "transparent"

            Row {
                anchors.top: parent.top
                anchors.topMargin: 5
                id: rowContent
                width: parent.width
                Text {
                    text: name
                    width: parent.width/4
                }
                Text {
                    text: summary
                    width: parent.width/4
                }
                Text {
                    text: body
                    width: parent.width/4
                }
                Text {
                    text: open
                    width: parent.width/4
                }
            }
            MouseArea {
                id: mouse
                anchors.fill: parent
                onClicked: {
                    if (open == "true") {
                        notificationMonitor.getNotification(nid).close()
                    }

                    console.log("clicked on " + nid + " test " + open)
                }
            }
        }
    }



}
