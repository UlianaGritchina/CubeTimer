import SwiftUI

struct RectangelButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray)
                            .frame(height: 45)
                    } else {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 45)
                            .foregroundColor(Color("background"))
                            .shadow(
                                color: Color("shadowStart"),
                                radius: 5, x: 10, y: 10)
                            .shadow(
                                color: Color("shadowEnd"),
                                radius: 5, x: -5, y: -5
                            )
                    }
                }
            )
    }
}
