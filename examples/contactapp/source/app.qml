import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {

	width: 500
	height: 300
    title: "ContactApp"
	visible: true

    menuBar: MenuBar {
        Menu {
            title: "&File"
            MenuItem { text: "&Load"; onTriggered: logic.onLoadTriggered() }
            MenuItem { text: "&Save"; onTriggered: logic.onSaveTriggered() }
            MenuItem { text: "&Exit"; onTriggered: logic.onExitTriggered() }
        }
    }

	ColumnLayout {
	    anchors.fill: parent

        TableView {
            model: logic.contactList
            Layout.fillWidth: true
            Layout.fillHeight: true

            delegate: RowLayout {
                Text {
                    id: tableText
                    text: model.firstName + " " + model.lastName
                }
                Button {
                    id: deleteButton
                    text: "Delete"
                    onClicked: logic.contactList.del(row)
                    }   
            }
        }

        RowLayout {
            Label { text: "FirstName" }
            TextField { id: nameTextField; Layout.fillWidth: true; text: "" }
            Label { text: "LastName" }
            TextField { id: surnameTextField; Layout.fillWidth: true; text: "" }
            Button {
                text: "Add"
                onClicked: logic.contactList.add(nameTextField.text, surnameTextField.text)
                enabled: nameTextField.text !== "" && surnameTextField.text !== ""
            }
        }
    }
}
