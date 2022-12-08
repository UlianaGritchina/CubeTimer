import SwiftUI

struct SavedView: View {
    var language: Language = UserDefaultsManager.shared.getLanguage()
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Rectangle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color("background"))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    .overlay {
                        Text(getTitle())
                            .font(.headline)
                            .opacity(0.8)
                    }
            }
            Spacer()
            Spacer()
        }
    }
    
    func getTitle() -> String {
        switch language {
        case .eng: return "Saved"
        case .rus: return "Сохранено"
        case .spain: return "Salvado"
        }
    }
    
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}
