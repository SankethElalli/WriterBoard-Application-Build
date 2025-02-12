cmake_minimum_required(VERSION 3.16)

# Set the project name and version
project(WriterBoard VERSION 0.1 LANGUAGES CXX)

# Enable automatic Qt features
set(CMAKE_AUTOUIC ON)  # Automatic UI file compilation
set(CMAKE_AUTOMOC ON)  # Automatic MOC generation for Qt
set(CMAKE_AUTORCC ON)  # Automatic resource file compilation

# Set C++ standard to C++17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Check for the required Qt components (Qt5 or Qt6)
find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Widgets Quick Qml)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets Quick Qml)

# Define the project source files
set(PROJECT_SOURCES
    main.cpp
    mainwindow.cpp
    mainwindow.h
    mainwindow.ui
    main.qrc
)

# Add the executable depending on the Qt version (for Windows, Linux, etc.)
if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(WriterBoard
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
    )
else()
    if(ANDROID)
        add_library(WriterBoard SHARED
            ${PROJECT_SOURCES}
        )
    else()
        add_executable(WriterBoard
            ${PROJECT_SOURCES}
        )
    endif()
endif()

# Link the necessary libraries
target_link_libraries(WriterBoard PRIVATE Qt${QT_VERSION_MAJOR}::Widgets Qt${QT_VERSION_MAJOR}::Quick Qt${QT_VERSION_MAJOR}::Qml)

# Additional settings for macOS and iOS, if applicable
if(${QT_VERSION} VERSION_LESS 6.1.0)
  set(BUNDLE_ID_OPTION MACOSX_BUNDLE_GUI_IDENTIFIER com.example.WriterBoard)
endif()

set_target_properties(WriterBoard PROPERTIES
    ${BUNDLE_ID_OPTION}
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

# Installation rules
include(GNUInstallDirs)
install(TARGETS WriterBoard
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# Finalize the executable for Qt 6 or higher
if(QT_VERSION_MAJOR EQUAL 6)
    qt_finalize_executable(WriterBoard)
endif()

# Debug output to ensure the correct Qt version is used
message(STATUS "Using Qt Version: ${QT_VERSION_MAJOR}")
