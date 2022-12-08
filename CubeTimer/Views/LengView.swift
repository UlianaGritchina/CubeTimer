import SwiftUI

struct LanguageView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    let type: Language
    @Binding var selected: Language
    let color: Color
    @State private var isSelected = false
    var body: some View {
        Button(action: {
            selected = type
            UserDefaultsManager.shared.saveLanguage(leng: selected)
            HapticManager.instance.impact(style: .light)
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: width / 5, height: width / 5)
                    .foregroundColor(color)
                    .overlay(
                        Text(type.rawValue)
                            .foregroundColor(.white)
                            .font(.system(size: height / 35))
                            .bold()
                )
                RoundedRectangle(cornerRadius: 12)
                    .stroke()
                    .frame(width: width / 5 + 5, height: width / 5 + 5)
                    .opacity(type == selected ? 1 : 0)
                    .foregroundColor(Color("selected"))
            }
        }
    }
}

struct CubeTypeView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageView(type: .rus, selected: .constant(.rus), color: .blue)
    }
}
