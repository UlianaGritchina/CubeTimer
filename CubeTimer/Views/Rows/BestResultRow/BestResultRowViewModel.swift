import SwiftUI

class BestResultRowViewModel: ObservableObject {
    
    @Published var language = UserDefaultsManager.shared.getLanguage()
    let colors: [Color] = [.red, .blue, .white, .yellow, .orange, .green]
    
    func getTitle() -> String {
        switch language {
        case .eng: return "Best result"
        case .rus: return "Лучший результат"
        case .spain: return "Mejor resultado"
        }
    }
    
    func setLanguage() {
        language = UserDefaultsManager.shared.getLanguage()
    }
    
}
