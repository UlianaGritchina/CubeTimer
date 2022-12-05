import Foundation

class StarterViewModel: ObservableObject {
    
    @Published var language: Language = .eng
    @Published var isStart = false
    @Published var isEnd = false
    
    init() {
       setLanguage()
    }
    
    func setLanguage() {
        language = UserDefaultsManager.shared.getLanguage()
    }
    
    func getMainTitle() -> String {
        switch language {
        case .eng: return "Main"
        case .rus: return "Главная"
        case .spain: return "Hogar"
        }
    }
    
    func getResultsTitle() -> String {
        switch language {
        case .eng: return "Results"
        case .rus: return "Результаты"
        case .spain: return "Resultados"
        }
    }
    
    func getSettingsTitle() -> String {
        switch language {
        case .eng: return "Settings"
        case .rus: return "Настройки"
        case .spain: return "Ajustes"
        }
    }
}
