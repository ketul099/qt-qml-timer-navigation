#include "TimerBackend.h"

/*
 * Constructor
 * -----------
 * Initializes the timer backend.
 * - Sets timer interval to 500 milliseconds
 * - Connects QTimer timeout signal to our custom slot (onTimerTick)
 */
TimerBackend::TimerBackend(QObject *parent)
    : QObject(parent)
{
    // Set internal Qt timer to trigger every 500ms
    m_timer.setInterval(500);

    // When timer times out → call onTimerTick()
    connect(&m_timer, &QTimer::timeout,
            this, &TimerBackend::onTimerTick);
}


/*
 * start()
 * -------
 * Starts the timer.
 * - If already running → do nothing
 * - Update running state
 * - Emit signal so QML updates
 * - Start Qt timer
 */
void TimerBackend::start()
{
    // Prevent starting twice
    if (m_running)
        return;

    m_running = true;

    // Notify QML that running state changed
    emit runningChanged();

    // Start periodic timer
    m_timer.start();
}


/*
 * pause()
 * -------
 * Stops the timer without resetting the value.
 * - Only works if currently running
 * - Update running state
 * - Emit signal for UI update
 * - Stop Qt timer
 */
void TimerBackend::pause()
{
    if (!m_running)
        return;

    m_running = false;

    // Notify QML
    emit runningChanged();

    // Stop periodic timer
    m_timer.stop();
}


/*
 * reset()
 * -------
 * Stops timer and resets all counters to zero.
 * - Stop timer
 * - Reset running state
 * - Reset internal counters
 * - Notify QML about state changes
 */
void TimerBackend::reset()
{
    // Stop timer immediately
    m_timer.stop();

    // Reset running state
    m_running = false;
    emit runningChanged();

    // Reset counters
    m_halfTicks = 0;   // counts 500ms intervals
    m_seconds = 0;     // actual seconds shown in UI

    // Notify QML that seconds changed
    emit secondsChanged();
}


/*
 * onTimerTick()
 * -------------
 * This slot is called every 500ms.
 *
 * Logic:
 * - Increase half-tick counter
 * - Convert half-ticks → seconds (2 ticks = 1 second)
 * - Only emit secondsChanged() if value actually changed
 */
void TimerBackend::onTimerTick()
{
    // Increment 500ms tick counter
    m_halfTicks++;

    // Convert ticks to seconds
    const int newSeconds = m_halfTicks / 2;

    // Emit signal only if seconds value changed
    // (Prevents unnecessary UI updates)
    if (newSeconds != m_seconds) {
        m_seconds = newSeconds;
        emit secondsChanged();
    }
}
