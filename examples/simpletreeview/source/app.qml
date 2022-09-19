import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import CustomModule

ApplicationWindow {
	visible: true
	width: 600
    height: 400
	title: qsTr("Simple Tree View")

	TreeView {
		anchors.fill: parent
		model: theModel
		delegate: Item {
			id: treeDelegate

			readonly property real indent: 20
            readonly property real padding: 5

			required property TreeView treeView
            required property bool isTreeNode
            required property bool expanded
            required property int hasChildren
            required property int depth

			implicitWidth: padding + label.x + label.implicitWidth + padding
			implicitHeight: label.implicitHeight * 1.5
			
			 TapHandler {
                onTapped: treeView.toggleExpanded(row)
            }

			Text {
                id: indicator
                visible: treeDelegate.isTreeNode && treeDelegate.hasChildren
                x: padding + (treeDelegate.depth * treeDelegate.indent)
                anchors.verticalCenter: label.verticalCenter
                text: "▸"
                rotation: treeDelegate.expanded ? 90 : 0
            }

			Text {
                id: label
                x: padding + (treeDelegate.isTreeNode ? (treeDelegate.depth + 1) * treeDelegate.indent : 0)
                width: treeDelegate.width - treeDelegate.padding - x
                clip: true
                text: model.summary.text
            }
		}
	}
}
