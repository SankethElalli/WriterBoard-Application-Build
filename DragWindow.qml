// Import necessary Qt modules for this application
import QtQuick 2.15  // Provides essential QML types like Rectangle, Item, etc.
import QtQuick.Controls 2.15  // Adds support for UI controls such as buttons, text fields, etc.
import QtQuick.Layouts 1.15  // Allows for layout management, such as positioning of items

Window {
    id: dragWindow
    visible: true
    flags: Qt.Window  // Makes the window behave like a standalone window
    color: "lightgray"  // Sets the background color of the window
    width: 300  // Window width
    height: 300  // Window height

    // Property to accept the dragged rectangle from the main.qml
    property var rectangleContent: null

    // Signal to emit when the window is closing, passing back the original rectangle and its properties
    signal windowClosing(var originalRectangle, var rectangleProperties)

    Rectangle {
        id: contentRectangle
        width: parent.width  // Match the width of the parent window
        height: parent.height  // Match the height of the parent window
        color: "lightgray"  // Background color of the rectangle
        border.color: "black"  // Border color of the rectangle

        Component.onCompleted: {
            // Ensure that a rectangle has been passed for re-parenting
            if (rectangleContent !== null) {
                console.log("Re-parenting the dragged rectangle and its children...");

                // Copy properties from the original rectangle to the new one
                contentRectangle.color = rectangleContent.color;
                contentRectangle.border.color = rectangleContent.border.color;

                // Re-parent all child items of the original rectangle to the new one
                for (var i = 0; i < rectangleContent.children.length; i++) {
                    var child = rectangleContent.children[i];
                    child.parent = contentRectangle;  // Assign new parent
                }

                // Make the newly transferred rectangle visible
                rectangleContent.visible = true;
            } else {
                console.log("Error: rectangleContent is null.");
            }
        }

        MouseArea {
            id: windowMouseArea
            anchors.fill: parent  // Fill the entire rectangle area with mouse interaction
            drag.target: contentRectangle  // Make the rectangle draggable within the window
        }
    }

    // Handle window closing event
    onClosing: {
        // Gather rectangle properties to pass back when the window closes
        var rectangleProps = {
            "color": contentRectangle.color,
            "borderColor": contentRectangle.border.color,
            "width": contentRectangle.width,
            "height": contentRectangle.height
        };

        // Emit the windowClosing signal to re-dock the rectangle with its properties
        windowClosing(rectangleContent, rectangleProps);
    }
}
