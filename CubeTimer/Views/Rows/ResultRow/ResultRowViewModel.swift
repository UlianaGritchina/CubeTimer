import Foundation

class ResultRowViewModel: ObservableObject {
    
    @Published var language: Language =  .eng
    @Published var isShowingSheet = false
    
    init() {
       setLanguage()
    }
    
    func setLanguage() {
        language =  UserDefaultsManager.shared.getLanguage()
    }
    
    func getButtonTitle() -> String {
        switch language {
        case .eng: return "Delete"
        case .rus: return "Удалить"
        case .spain: return "Borrar"
        }
    }
    
    func getText(result: Result) -> String {
        switch language {
        case .eng: return "Do you want to delete result: \(result.time)?"
        case .rus: return "Удалить результат: \(result.time)?"
        case .spain: return "Eliminar resultado: \(result.time)?"
        }
    }
    
    func showSheet() {
        isShowingSheet.toggle()
    }
}
