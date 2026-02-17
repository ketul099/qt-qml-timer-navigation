#pragma once

#include <QObject>
#include <QTimer>

// Simple timer backend:
// - ticks every 500 ms
// - counts seconds (2 ticks = 1 second)
// - exposes seconds + running to QML
class TimerBackend : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int seconds READ seconds NOTIFY secondsChanged)
    Q_PROPERTY(bool running READ running NOTIFY runningChanged)

public:
    explicit TimerBackend(QObject *parent = nullptr);

    int seconds() const { return m_seconds; }
    bool running() const { return m_running; }

    Q_INVOKABLE void start();
    Q_INVOKABLE void pause();
    Q_INVOKABLE void reset();

signals:
    void secondsChanged();
    void runningChanged();

private slots:
    void onTimerTick();

private:
    QTimer m_timer;
    int m_halfTicks = 0;
    int m_seconds = 0;
    bool m_running = false;
};
