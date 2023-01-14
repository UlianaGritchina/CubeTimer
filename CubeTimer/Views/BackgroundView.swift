import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Image("back")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.5)
                .blur(radius: 6)
            Rectangle()
                .opacity(0)
                .ignoresSafeArea()
                .background(.ultraThinMaterial)
                .opacity(0.9)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
