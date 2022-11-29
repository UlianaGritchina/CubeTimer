import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private init() { }
    
    func save(_ results: [Result]) {
        if let encodedData = try? JSONEncoder().encode(results) {
            UserDefaults.standard.set(encodedData, forKey: "results")
        }
    }
    
}

