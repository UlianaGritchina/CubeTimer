import SwiftUI

enum Side {
    case right
    case left
}

class TimerViewModel: ObservableObject {
    
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var timeRemaining = 0
    @Published var isStart = false
    
    func startCount() {
        if isStart {
            timeRemaining += 1
        }
    }
    
    func startOrStopTimer(_ side: Side) {
        if side == .left {
            isStart.toggle()
        }
    }
    
}
