import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    width: 400
    height: 300
    title: "SimpleData"

    Component.onCompleted: visible = true

    ColumnLayout {
        anchors.fill: parent
        SpinBox { value: qVar1}
        TextField { text: qVar2}
        CheckBox { checked: qVar3}
        SpinBox { 
            property int decimals: 1
            property int mul: 10
            property real realValue: qVar4
            value: realValue*mul

            textFromValue: function(value, locale) {
                return Number(value / mul).toLocaleString(locale, 'f', decimals)
            }

            valueFromText: function(text, locale) {
                return Number.fromLocaleString(locale, text) * mul
            } 
        }
    }
}
