import SwiftUI

class TimerViewModel: ObservableObject {
    
    @Published var timer: Timer?
    @Published var isStart = false
    @Published var isShowingButtons = false
    @Published var isShowingSaveView = false
    @Published var stopwatch = Stopwatch(min: 0, seconds: 0, milliseconds: 0)
    @Published var results: [Result] = []
    
    private var result: Result = Result(time: "", date: "")
    
    init() {
        getResults()
    }
    
    func startOrStopStopwatch() {
        isStart.toggle()
        if isStart {
            startStopwatch()
        } else {
            stopStopwatch()
        }
    }
    
    func getResults() {
        guard
            let data = UserDefaults.standard.data(forKey: "results"),
            let savedResults = try? JSONDecoder().decode([Result].self, from: data)
        else { return }
        
        results = savedResults
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
        isShowingButtons = false
    }
    
    func saveResult() {
        results.append(Result(time: formatResultString(), date: getFormattedDate(date: Date())))
        UserDefaultsManager.shared.save(results)
        withAnimation {
            isShowingSaveView = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                self.isShowingSaveView = false
            }
        }
    }
    
    private func formatResultString() -> String {
        "\(stopwatch.min) : \(stopwatch.seconds) , \(stopwatch.milliseconds)"
    }
    
    func getFormattedDate(date: Date) -> String {
        let format = "MMM dd yyyy   HH:mm"
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: date)
    }
    
}
