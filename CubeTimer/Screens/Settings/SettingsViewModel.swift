import Foundation

enum Language: String, Codable {
    case eng = "Eng"
    case rus = "Rus"
    case spain = "Es"
}

class SettingsViewModel: ObservableObject {
    
    @Published var selectedLeng: Language = .eng
    @Published var scramble = UserDefaultsManager.shared.getIsScrsmbrl()
    
    init() {
        setLanguage()
        print(UserDefaultsManager.shared.getIsScrsmbrl())
    }
    
    func saveScrubble(_ value: Bool) {
        UserDefaultsManager.shared.setIsScrambel(scramble)
    }
    
    func setLanguage() {
        selectedLeng = UserDefaultsManager.shared.getLanguage()
    }
    
    func getMainTitle() -> String {
        switch selectedLeng {
        case .eng: return "Settings"
        case .rus: return "Настройки"
        case .spain: return "Ajustes"
        }
    }
    
    func getLengTitle() -> String {
        switch selectedLeng {
        case .eng: return "Language"
        case .rus: return "Язык"
        case .spain: return "Idioma"
        }
    }
    
    func getRwviewTitle() -> String {
        switch selectedLeng {
        case .eng: return "Evaluate"
        case .rus: return "Оценить"
        case .spain: return "Evaluar"
        }
    }
    
    func getScrubleTitle() -> String {
        switch selectedLeng {
        case .eng: return "Show scramble"
        case .rus: return "Показывать скрамбл"
        case .spain: return "Mostrar scramble"
        }
    }
    
}
