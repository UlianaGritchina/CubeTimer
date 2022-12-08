import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            Color("gradientEnd"),
            Color("gardientStart")
        )
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
