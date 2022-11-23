import SwiftUI

enum Side {
    case right
    case left
}

class TimerViewModel: ObservableObject {
    
    @Published var timer: Timer?
    @Published var isStart = false
    @Published var isShowingButtons = false
    @Published var stopwatch = Stopwatch(min: 0, seconds: 0, milliseconds: 0)
    
    func startOrStopStopwatch(_ side: Side) {
        if side == .left {
            isStart.toggle()
            if isStart {
                startStopwatch()
            } else {
                stopStopwatch()
            }
        }
    }
    
    private func startStopwatch() {
        isShowingButtons = false
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] (_) in
            self?.stopwatch.milliseconds += 1
            if self?.stopwatch.milliseconds == 100 {
                self?.stopwatch.milliseconds = 0
                self?.stopwatch.seconds += 1
            }
            if self?.stopwatch.seconds == 60 {
                self?.stopwatch.seconds = 0
                self?.stopwatch.min += 1
            }
        })
    }
    
    func stopStopwatch() {
        timer?.invalidate()
        timer = nil
        isShowingButtons = true
    }
    
    func rest() {
        stopwatch = Stopwatch(min: 0, seconds: 0, milliseconds: 0)
    }
    
}
