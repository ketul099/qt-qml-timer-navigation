// Provides GUI application base class
#include <QGuiApplication>

// Loads and manages QML engine
#include <QQmlApplicationEngine>

// Allows exposing C++ objects to QML
#include <QQmlContext>

// Our custom timer backend class
#include "TimerBackend.h"


/*
 * main()
 * ------
 * Entry point of the application.
 *
 * Responsibilities:
 *  - Initialize Qt application
 *  - Create QML engine
 *  - Expose C++ backend to QML
 *  - Load QML module
 *  - Start event loop
 */
int main(int argc, char *argv[])
{
    // Create Qt GUI application object
    // Manages application-wide resources and event loop
    QGuiApplication app(argc, argv);

    // Create QML engine
    // Responsible for loading and running QML UI
    QQmlApplicationEngine engine;


    // -------------------------------------------------
    // Create C++ backend object
    // -------------------------------------------------
    TimerBackend timerBackend;

    /*
     * Expose C++ object to QML.
     *
     * Now in QML we can access:
     *   timerBackend.seconds
     *   timerBackend.running
     *   timerBackend.start()
     *   timerBackend.pause()
     *   timerBackend.reset()
     */
    engine.rootContext()->setContextProperty(
        "timerBackend",
        &timerBackend
    );


    // -------------------------------------------------
    // Load QML module (Qt6 modern way)
    // -------------------------------------------------

    /*
     * "QtTimerApp" → matches URI in CMake:
     *
     * qt_add_qml_module(appQtTimerApp
     *     URI QtTimerApp
     * )
     *
     * "Main" → loads Main.qml
     */
    engine.loadFromModule("QtTimerApp", "Main");


    /*
     * Start Qt event loop.
     * The program stays here until the window is closed.
     */
    return app.exec();
}
