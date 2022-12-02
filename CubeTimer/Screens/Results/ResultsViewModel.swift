import SwiftUI

class ResultsViewModel: ObservableObject {
    
    @Published var results: [Result] = []
    @Published var bestResult: Result? = nil
    
    var isResultsExists: Bool {
        results.count > 0
    }
    
    init() {
        getResults()
    }
    
    func getResults() {
        guard
            let data = UserDefaults.standard.data(forKey: "results"),
            let savedResults = try? JSONDecoder().decode([Result].self, from: data)
        else { return }
        
        results = savedResults.reversed()
    }
    
    func delete(_ result: Result) {
        results = results.filter { $0 != result }
        saveResult()
        getBestResult()
    }
    
    private func saveResult() {
        UserDefaultsManager.shared.save(results)
    }
    
    func getBestResult() {
        guard let lastResult = results.last else {
            bestResult = nil
            return
        }
        bestResult = lastResult
        for result in results {
            if result.time < bestResult?.time ?? "" {
                bestResult = result
            }
        }
    }
    
}
