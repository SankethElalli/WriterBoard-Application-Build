import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: Screen.width  // Set the width of the window to the screen's width
    height: Screen.height  // Set the height of the window to the screen's height

    // Define color properties directly in the ApplicationWindow for easy reuse
    property color grey900: "#404040"  // Dark grey color
    property color grey800: "#575757"  // Medium grey color
    property color grey100: "#f2f2f2"  // Light grey color
    property color blue100: "#2481B6"  // Blue color

    Material.theme: Material.Dark  // Set the Material theme to dark mode

    ListModel {
        id: rectangleModel  // Empty model for possible future use
    }

    // ColumnLayout arranges child items vertically
    ColumnLayout {
        anchors.fill: parent  // Fill the entire window with the layout
        spacing: 0  // No spacing between the child items

        // Top navigation bar
        Rectangle {
            id: top_nav_container
            color: blue100  // Set background color to blue
            Layout.fillWidth: true  // Fill the entire width of the layout
            Layout.preferredHeight: 35  // Set the height of the navigation bar
            border.color: "black"  // Set border color to black

            // Inside the navigation bar, define a ColumnLayout for alignment
            ColumnLayout {
                anchors.fill: parent  // Fill the parent rectangle
                spacing: 0  // No spacing between the items

                // Top navigation bar inner section
                Rectangle {
                    id: top_navbar
                    color: grey800  // Set the background color to grey
                    Layout.fillWidth: true  // Fill the width
                    Layout.preferredHeight: 35  // Set height

                    // Centered text block inside the navigation bar
                    Rectangle {
                        color: grey900  // Dark grey background
                        width: 70
                        height: 30
                        anchors.horizontalCenter: parent.horizontalCenter  // Center horizontally
                        anchors.top: parent.top  // Align to top
                        radius: 2  // Rounded corners

                        Text {
                            text: qsTr("Story Name")  // Display "Story Name" text
                            color: "white"  // White text color
                            anchors.horizontalCenter: parent.horizontalCenter  // Center horizontally
                            anchors.verticalCenter: parent.verticalCenter  // Center vertically
                        }
                    }

                    // RowLayout to arrange items (buttons) horizontally on the left side
                    RowLayout {
                        anchors.left: parent.left  // Align to the left of the parent
                        anchors.verticalCenter: parent.verticalCenter  // Vertically centered
                        spacing: 10  // Set spacing between items

                        // Left-side button (with an image)
                        Rectangle {
                            width: 60
                            height: 40
                            color: "transparent"  // Transparent background

                            Image {
                                source: "qrc:/icons/logo - Transparent.svg"  // Logo image source
                                anchors.centerIn: parent  // Center the image inside the rectangle
                            }

                            MouseArea {
                                anchors.fill: parent  // Make the whole rectangle clickable
                                onClicked: {
                                    console.log("Left Button 3 clicked")  // Log the click event
                                }
                            }
                        }

                        // Separator between buttons
                        Rectangle {
                            height: 40
                            color: "transparent"  // Transparent separator
                            width: 30  // Width of the separator
                            Image {
                                source: "qrc:/icons/seprator.svg"  // Separator image source
                                anchors.centerIn: parent  // Center the image
                            }
                        }

                        // File button on the left side
                        Rectangle {
                            width: 30
                            height: 40
                            color: "transparent"  // Transparent background

                            Text {
                                anchors.centerIn: parent  // Center text inside the rectangle
                                text: "File"  // File button label
                                color: "white"  // White text color
                            }

                            MouseArea {
                                anchors.fill: parent  // Make the entire rectangle clickable
                                onClicked: {
                                    console.log("Left Button 1 clicked")  // Log the click event
                                }
                            }
                        }

                        // Additional buttons (Edit, View, Help) on the left side
                        Rectangle {
                            id: viewButton
                            width: 30
                            height: 40
                            color: "transparent"  // Transparent background

                            Text {
                                anchors.centerIn: parent
                                text: "Edit"  // Label for the "Edit" button
                                color: "white"  // White text color
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("Left Button 2 clicked")  // Log the click event
                                }
                            }
                        }

                        Rectangle {
                            width: 30
                            height: 40
                            color: "transparent"

                            Text {
                                anchors.centerIn: parent
                                text: "View"  // Label for the "View" button
                                color: "white"  // White text color
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    viewMenu.popup()  // Open the view menu on click
                                }
                            }
                        }

                        Rectangle {
                            width: 30
                            height: 40
                            color: "transparent"

                            Text {
                                anchors.centerIn: parent
                                text: "Help"  // Label for the "Help" button
                                color: "white"  // White text color
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("Left Button 3 clicked")  // Log the click event
                                }
                            }
                        }
                    }

                    // Right-side buttons (Share, Minimize, Resize, Close)
                    RowLayout {
                        anchors.right: parent.right  // Align to the right side
                        anchors.verticalCenter: parent.verticalCenter  // Vertically centered

                        // Share button with an image and text
                        Rectangle {
                            id: share
                            height: 30
                            color: blue100  // Blue background
                            width: 80  // Width of the Share button
                            radius: 5  // Rounded corners

                            Image {
                                id: share_img
                                source: "qrc:/icons/Forward.svg"  // Share icon image source
                                anchors.leftMargin: 5  // Margin from the left
                                anchors.verticalCenter: parent.verticalCenter  // Vertically centered
                                anchors.left: parent.left  // Align to the left
                            }

                            Text {
                                id: share_text
                                anchors.left: share_img.right  // Align text to the right of the image
                                anchors.leftMargin: 5  // Left margin
                                color: "white"  // White text color
                                anchors.verticalCenter: parent.verticalCenter  // Vertically centered
                                anchors.horizontalCenter: parent.horizontalCenter  // Horizontally centered
                                text: qsTr("share")  // Label text
                            }

                            MouseArea {
                                anchors.fill: parent  // Make the entire rectangle clickable
                                onClicked: {
                                    console.log("Left Button 1 clicked")  // Log the click event
                                }
                            }
                        }

                        // Separator between buttons
                        Rectangle {
                            id: seprator
                            height: 40
                            color: "transparent"
                            width: 30
                            Image {
                                source: "qrc:/icons/seprator.svg"  // Separator image source
                                anchors.centerIn: parent  // Center the image
                            }
                        }

                        // Minimize, Resize, and Close buttons
                        Rectangle {
                            width: 40
                            height: 20
                            color: "transparent"

                            Image {
                                source: "qrc:/icons/Minus.svg"  // Minimize icon
                                anchors.verticalCenter: parent.verticalCenter  // Vertically centered
                                width: 15  // Image width
                                height: 15  // Image height
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("Left Button 1 clicked")  // Log the click event
                                }
                            }
                        }

                        Rectangle {
                            width: 40
                            height: 30
                            color: "transparent"

                            Image {
                                source: "qrc:/icons/resize.svg"  // Resize icon
                                anchors.verticalCenter: parent.verticalCenter  // Vertically centered
                                width: 15
                                height: 15
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("Left Button 2 clicked")  // Log the click event
                                }
                            }
                        }

                        Rectangle {
                            width: 40
                            height: 30
                            color: "transparent"

                            Image {
                                source: "qrc:/icons/Close.svg"  // Close icon
                                anchors.verticalCenter: parent.verticalCenter  // Vertically centered
                                width: 15
                                height: 15
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("Left Button 3 clicked")  // Log the click event
                                }
                            }
                        }
                    }

                    // Menu for the View button
                    Menu {
                        id: viewMenu
                        MenuItem {
                            text: "Node Graph"  // First option in the menu
                            onTriggered: console.log("Option 1 selected")  // Log when clicked
                        }
                        MenuItem {
                            text: "Overviewer"  // Second option
                            onTriggered: console.log("Option 2 selected")  // Log when clicked
                        }
                        MenuItem {
                            text: "Option 3"  // Third option
                            onTriggered: console.log("Option 3 selected")  // Log when clicked
                        }
                    }
                }
            }
        }

/////////////////////////////////////////////////////////////////////
        //bottom containrer
        // Bottom container which holds the main content
        Rectangle {
            id: bottom_container
            color: grey800  // Set the background color to grey
            Layout.fillWidth: true  // Fill the width of the parent
            Layout.preferredHeight: parent.height - 35  // Set height relative to the parent minus 35 for the top bar


            // RowLayout for arranging child items side by side
            RowLayout {
                anchors.fill: parent  // Fill the bottom_container completely
                spacing: 0  // No space between child items

                // Left navigation bar
                Rectangle {
                    id: left_navbar
                    color: grey800  // Set background color to grey
                    Layout.fillWidth: true
                    Layout.preferredWidth: 50  // Set the width of the left navigation bar
                    Layout.fillHeight: true  // Fill the height of the parent

                    // ColumnLayout for arranging icons in a vertical stack
                    ColumnLayout {
                        spacing: 0  // No space between icons
                        anchors.top: parent.top  // Align to the top of the parent

                        // Home button
                        Rectangle {
                            Layout.preferredWidth: 50  // Fixed width for the icon
                            height: 40  // Height for the Home button
                            color: "transparent"  // Transparent background
                            Image {
                                anchors.horizontalCenter: parent.horizontalCenter  // Center horizontally
                                anchors.verticalCenter: parent.verticalCenter  // Center vertically
                                source: "qrc:/icons/Home_icon.svg"  // Home icon
                            }

                            // MouseArea for click detection
                            MouseArea {
                                anchors.fill: parent  // Make the entire rectangle clickable
                                onClicked: {
                                    console.log("Button 1 clicked")  // Log click event
                                }
                            }
                        }

                        // Selection Mode button
                        Rectangle {
                            Layout.preferredWidth: 50  // Fixed width for the icon
                            height: 50  // Height for the button
                            color: "transparent"
                            Image {
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                source: "qrc:/icons/Selection Mode.svg"  // Selection mode icon
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("Home clicked")  // Log click event
                                }
                            }
                        }

                        // Add Node button
                        Rectangle {
                            Layout.preferredWidth: 50
                            height: 50
                            color: "transparent"
                            Image {
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                source: "qrc:/icons/Add Node.svg"  // Add Node icon
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("Settings clicked")  // Log click event
                                    // Add a new entry to rectangleModel
                                    rectangleModel.append({ "text": "Button " + (rectangleModel.count + 1) });
                                }
                            }
                        }

                        // Notebook button
                        Rectangle {
                            Layout.preferredWidth: 50
                            height: 50
                            color: "transparent"
                            Image {
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                source: "qrc:/icons/Notebook.svg"  // Notebook icon
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("Profile clicked")  // Log click event
                                }
                            }
                        }

                        // Characters button
                        Rectangle {
                            Layout.preferredWidth: 50
                            height: 50
                            color: "transparent"
                            Image {
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                source: "qrc:/icons/Characters.svg"  // Characters icon
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("Logout clicked")  // Log click event
                                }
                            }
                        }
                    }
                }

                // Right container for dynamic content
                Rectangle {
                    id: right_container
                    color: "lightgray"  // Light grey background
                    Layout.fillWidth: true  // Fill the remaining width
                    Layout.fillHeight: true  // Fill the height of the parent
                    Layout.preferredWidth: parent.width - 50  // Adjust width minus the left navigation bar

                    // RowLayout for arranging content inside the right container
                    RowLayout {
                        anchors.fill: parent  // Fill the right_container
                        spacing: 0  // No spacing between items

                        // SplitView for resizable panes
                        SplitView {
                            id: splitter
                            anchors.fill: parent  // Fill the parent
                            orientation: Qt.Horizontal  // Horizontal orientation for side-by-side panes

                            // First rectangle pane
                            Rectangle {
                                id: rectangle1
                                width: parent.width / 2  // Half of the width
                                height: parent.height  // Full height
                                color: "grey"  // Blue background

                                // Content inside the first rectangle
                                ColumnLayout {
                                    anchors.centerIn: parent  // Center content
                                    Text {
                                        text: "This is Rectangle 1"  // Label text
                                        color: "white"  // White text color
                                    }
                                    Button {
                                        text: "Click Me"  // Button text
                                        onClicked: console.log("hello ")  // Log button click
                                    }
                                }

                                // Drag bar for splitting and detaching rectangles
                                Rectangle {
                                    id: dragBar1
                                    width: parent.width  // Full width
                                    height: 20  // Height for the drag bar
                                    color: "lightgrey"  // Light blue background
                                    anchors.top: parent.top  // Align to the top of the parent

                                    MouseArea {
                                        id: dragArea1
                                        anchors.fill: parent  // Make the entire drag bar clickable and draggable
                                        drag.target: null
                                        drag.axis: Drag.XAndYAxis  // Enable dragging in both directions

                                        onReleased: {
                                            // Create a new window and pass rectangle1 for dragging
                                            var newWindow = Qt.createComponent("DragWindow.qml").createObject(rectangle1, {
                                                "x": rectangle1.x,
                                                "y": rectangle1.y,
                                                "width": rectangle1.width,
                                                "height": rectangle1.height,
                                                "rectangleContent": rectangle1  // Pass the content
                                            });

                                            if (newWindow === null) {
                                                console.log("Failed to create a new window.");
                                            } else {
                                                console.log("Successfully created the new window.");
                                                newWindow.visible = true;

                                                // Detach rectangle1 and expand rectangle2
                                                rectangle1.parent = null;
                                                rectangle2.width = parent.width;

                                                // Re-dock rectangle when window closes
                                                newWindow.windowClosing.connect(function(originalRectangle, rectangleProps) {
                                                    originalRectangle.parent = splitter;
                                                    // Restore rectangle properties
                                                    originalRectangle.color = rectangleProps.color;
                                                    originalRectangle.border.color = rectangleProps.borderColor;
                                                    originalRectangle.width = rectangleProps.width;
                                                    originalRectangle.height = rectangleProps.height;
                                                    rectangle2.width = parent.width / 2;  // Restore widths
                                                });
                                            }
                                        }
                                    }
                                }
                            }

                            // Second rectangle pane
                            Rectangle {
                                id: rectangle2
                                width: parent.width / 2  // Half of the width
                                height: parent.height  // Full height
                                color: "grey"  // Grey background

                                Text {
                                    anchors.centerIn: parent  // Center the text
                                    text: "This is Rectangle 2"  // Label text
                                    color: "white"  // White text color
                                }

                                // Drag bar for splitting and detaching rectangles
                                Rectangle {
                                    id: dragBar2
                                    width: parent.width
                                    height: 20
                                    color: "lightgrey"  // Light grey background
                                    anchors.top: parent.top  // Align to the top of the parent

                                    MouseArea {
                                        id: dragArea2
                                        anchors.fill: parent  // Make the entire drag bar clickable and draggable
                                        drag.target: null
                                        drag.axis: Drag.XAndYAxis

                                        onReleased: {
                                            // Create a new window for rectangle2
                                            var newWindow = Qt.createComponent("DragWindow.qml").createObject(rectangle2, {
                                                "x": rectangle2.x,
                                                "y": rectangle2.y,
                                                "width": rectangle2.width,
                                                "height": rectangle2.height,
                                                "rectangleContent": rectangle2
                                            });

                                            if (newWindow === null) {
                                                console.log("Failed to create a new window.");
                                            } else {
                                                console.log("Successfully created the new window.");
                                                newWindow.visible = true;

                                                // Detach rectangle2 and expand rectangle1
                                                rectangle2.parent = null;
                                                rectangle1.width = parent.width;

                                                // Re-dock rectangle when window closes
                                                newWindow.windowClosing.connect(function(originalRectangle, rectangleProps) {
                                                    originalRectangle.parent = splitter;
                                                    // Restore rectangle properties
                                                    originalRectangle.color = rectangleProps.color;
                                                    originalRectangle.border.color = rectangleProps.borderColor;
                                                    originalRectangle.width = rectangleProps.width;
                                                    originalRectangle.height = rectangleProps.height;
                                                    rectangle1.width = parent.width / 2;  // Restore widths
                                                });
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

