import SwiftUI

struct BackgroundView: View {
    let color: Color
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [color.opacity(0.8), .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(color: .green)
    }
}
