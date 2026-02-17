cmake_minimum_required(VERSION 3.16)

project(QtTimerApp VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appQtTimerApp
    main.cpp
    TimerBackend.cpp
    TimerBackend.h
)

qt_add_qml_module(appQtTimerApp
    URI QtTimerApp
    VERSION 1.0
    QML_FILES
        Main.qml
        MenuScreen.qml
        Screen1.qml
)

target_link_libraries(appQtTimerApp PRIVATE Qt6::Quick)
