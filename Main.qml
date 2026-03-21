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
        onNotification: function(n) {
            history.append({
                "name": n.appName,
                "summary": n.summary,
                "body": n.body
            });
        }
    }

    ListModel {
        id: history
        ListElement {
            name: "appName"
            summary: "summary" 
            body: "body"
        }
    }

    ListView {
        anchors.fill: parent
        model: history
        delegate: Row {
            width: appwindow.width
            Text {
                text: name
                width: parent.width/3
            }
            Text {
                text: summary
                width: parent.width/3
            }
            Text {
                text: body
                width: parent.width/3
            }
        }
    }



}
