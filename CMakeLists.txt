# Minimum CMake version required
cmake_minimum_required(VERSION 3.16)

# Project name, version, and language
project(QtTimerApp VERSION 1.0 LANGUAGES CXX)

# Use C++17 standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


# -------------------------------------------------
# Find required Qt6 modules
# -------------------------------------------------
# Quick includes:
#   - Qt Quick
#   - Qt Quick Controls
#   - QML engine
find_package(Qt6 REQUIRED COMPONENTS Quick)


# Standard Qt project setup (recommended for Qt6)
qt_standard_project_setup()


# -------------------------------------------------
# Create executable target
# -------------------------------------------------
# appQtTimerApp = executable name
qt_add_executable(appQtTimerApp
    main.cpp
    TimerBackend.cpp
    TimerBackend.h
)


# -------------------------------------------------
# Add QML module
# -------------------------------------------------
# URI QtTimerApp → used in:
# engine.loadFromModule("QtTimerApp", "Main");
#
# QML files are compiled into Qt Resource System (qrc)
qt_add_qml_module(appQtTimerApp
    URI QtTimerApp
    VERSION 1.0
    QML_FILES
        Main.qml
        MenuScreen.qml
        Screen1.qml
)


# -------------------------------------------------
# Link Qt libraries to executable
# -------------------------------------------------
target_link_libraries(appQtTimerApp PRIVATE Qt6::Quick)
