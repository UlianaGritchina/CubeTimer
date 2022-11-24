import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .opacity(0.3)
                .ignoresSafeArea()
                .scaledToFill()
            
            Rectangle()
                .opacity(0)
                .background(.ultraThinMaterial)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
