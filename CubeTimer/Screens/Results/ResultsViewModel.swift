import SwiftUI

class ResultsViewModel: ObservableObject {
    var results: [Result] = []
    
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
    
    
}
