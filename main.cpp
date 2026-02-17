#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "TimerBackend.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    TimerBackend timerBackend;
    engine.rootContext()->setContextProperty("timerBackend", &timerBackend);

    // ✅ Correct Qt6 loading method
    engine.loadFromModule("QtTimerApp", "Main");

    return app.exec();
}
