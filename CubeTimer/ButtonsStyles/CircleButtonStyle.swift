import SwiftUI

struct CircleButtonStyle: ButtonStyle {
    let width: CGFloat
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color("background"))
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                            )
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
                            )
                            .frame(width: width, height: width)
                    } else {
                        Circle()
                            .foregroundColor(Color("background"))
                            .shadow(
                                color: Color("shadowStart"),
                                radius: 5, x: 10, y: 10)
                            .shadow(
                                color: Color("shadowEnd"),
                                radius: 5, x: -5, y: -5
                            )
                            .frame(width: width, height: width)
                    }
                }
            )
    }
}
