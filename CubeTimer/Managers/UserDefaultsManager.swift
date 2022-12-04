import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private init() { }
    
    func save(_ results: [Result]) {
        if let encodedData = try? JSONEncoder().encode(results) {
            UserDefaults.standard.set(encodedData, forKey: "results")
        }
    }
    
    func setIsScrambel(_ isScramble: Bool) {
        UserDefaults.standard.set(isScramble, forKey: "isScramble")
    }
    
    func getIsScrsmbrl() -> Bool {
        UserDefaults.standard.bool(forKey: "isScramble")
    }
    
    func saveLanguage(leng: Language) {
        if let encodedData = try? JSONEncoder().encode(leng) {
            UserDefaults.standard.set(encodedData, forKey: "leng")
        }
    }
    
    func getLanguage() -> Language {
        guard
            let data = UserDefaults.standard.data(forKey: "leng"),
            let leng = try? JSONDecoder().decode(Language.self, from: data)
        else { return .eng }
        return leng
    }
    
}

