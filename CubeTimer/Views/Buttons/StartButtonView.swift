import SwiftUI

struct StartButtonView: View {
    let action: () -> ()
    let width: CGFloat
    var body: some View {
        Button(action: action) {
           Text("hold")
                .opacity(0.7)
        }
        .buttonStyle(CircleButtonStyle(width: width))
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView(action: { }, width: 100)
    }
}

