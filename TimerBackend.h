#pragma once   // Prevents multiple inclusion of this header file

// Base Qt object class (needed for signals, slots, properties)
#include <QObject>

// Qt timer class for periodic events
#include <QTimer>


/*
 * TimerBackend
 * ------------
 * This class provides the timer logic for the application.
 *
 * Responsibilities:
 *  - Run a timer with 500ms interval
 *  - Convert ticks to seconds (2 ticks = 1 second)
 *  - Expose timer state to QML
 *
 * Architecture:
 *  - UI (QML) interacts with this class
 *  - Business logic remains in C++
 */
class TimerBackend : public QObject
{
    Q_OBJECT   // Required for signals, slots, and Q_PROPERTY


    /*
     * Q_PROPERTY
     * ----------
     * Makes C++ variables accessible in QML.
     *
     * Format:
     * Q_PROPERTY(type name READ getter NOTIFY signal)
     */

    // Exposes current seconds value to QML
    Q_PROPERTY(int seconds READ seconds NOTIFY secondsChanged)

    // Exposes running state (true = timer active)
    Q_PROPERTY(bool running READ running NOTIFY runningChanged)


public:
    // Constructor
    explicit TimerBackend(QObject *parent = nullptr);

    /*
     * Getter functions
     * -----------------
     * Used by Q_PROPERTY READ
     * QML reads these values automatically
     */

    int seconds() const { return m_seconds; }
    bool running() const { return m_running; }


    /*
     * Q_INVOKABLE
     * -----------
     * Allows QML to directly call these C++ functions.
     *
     * Example in QML:
     * timerBackend.start()
     */

    Q_INVOKABLE void start();   // Start timer
    Q_INVOKABLE void pause();   // Pause timer
    Q_INVOKABLE void reset();   // Reset timer to zero


signals:
    /*
     * Signals
     * -------
     * Emitted when property values change.
     * Required for QML automatic UI updates.
     */

    void secondsChanged();
    void runningChanged();


private slots:
    /*
     * Slot function
     * -------------
     * Called when QTimer timeout occurs (every 500ms).
     */
    void onTimerTick();


private:
    /*
     * Internal Variables
     */

    QTimer m_timer;       // Internal Qt timer (500ms interval)

    int m_halfTicks = 0;  // Counts number of 500ms ticks
                          // 2 ticks = 1 second

    int m_seconds = 0;    // Current seconds value displayed in UI

    bool m_running = false; // Current running state of timer
};
