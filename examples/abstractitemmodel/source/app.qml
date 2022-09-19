import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow
{
    width: 400
    height: 300
    title: "AbstractItemModel"
    Component.onCompleted: visible = true

    Component
    {
        id: myListModelDelegate
        Label { text: "Name: " + name }
    }
    
    ListView
    {
        anchors.fill: parent
        model: myListModel
        delegate: myListModelDelegate
    }
}