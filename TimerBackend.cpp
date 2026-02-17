#include "TimerBackend.h"

TimerBackend::TimerBackend(QObject *parent)
    : QObject(parent)
{
    m_timer.setInterval(500);
    connect(&m_timer, &QTimer::timeout, this, &TimerBackend::onTimerTick);
}

void TimerBackend::start()
{
    if (m_running) return;

    m_running = true;
    emit runningChanged();
    m_timer.start();
}

void TimerBackend::pause()
{
    if (!m_running) return;

    m_running = false;
    emit runningChanged();
    m_timer.stop();
}

void TimerBackend::reset()
{
    m_timer.stop();

    m_running = false;
    emit runningChanged();

    m_halfTicks = 0;
    m_seconds = 0;
    emit secondsChanged();
}

void TimerBackend::onTimerTick()
{
    m_halfTicks++;

    const int newSeconds = m_halfTicks / 2;
    if (newSeconds != m_seconds) {
        m_seconds = newSeconds;
        emit secondsChanged();
    }
}
