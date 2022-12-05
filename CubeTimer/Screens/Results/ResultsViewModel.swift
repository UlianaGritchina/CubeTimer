import SwiftUI

class ResultsViewModel: ObservableObject {
    
    @Published var results: [Result] = []
    @Published var bestResult: Result? = nil
    @Published var language: Language = .eng
    
    var isResultsExists: Bool {
        results.count > 0
    }
    
    init() {
        getResults()
        setLanguage()
    }
    
    func getMainTitle() -> String {
        switch language {
        case .eng: return "Rsults"
        case .rus: return "Результаты"
        case .spain: return "Resultados"
        }
    }
    
    func getNoResultsTitle() -> String {
        switch language {
        case .eng: return "No saved results"
        case .rus: return "Нет рзультатов"
        case .spain: return "No hay resultados"
        }
    }
    func setLanguage() {
        language = UserDefaultsManager.shared.getLanguage()
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
            if result.times[0] < bestResult?.times[0] ?? 0 {
                bestResult = result
            } else if result.times[0] == bestResult?.times[0] ?? 0 {
                if result.times[1] < bestResult?.times[1] ?? 0 {
                    bestResult = result
                } else {
                    if result.times[1] == bestResult?.times[1] ?? 0 {
                        if result.times[2] < bestResult?.times[2] ?? 0 {
                            bestResult = result
                        }
                    }
                }
            }
        }
    }
    
}
