import SwiftUI

struct StartButtonView: View {
    let action: () -> ()
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
                    .frame(width: width / 3.5, height: width / 3.5)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 3, y: 5)
                
                Circle()
                    .frame(width: width / 3.5 - 10, height: width / 3.5 - 10)
                    .opacity(0)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
                    .overlay {
                        Image(systemName: "eject.fill")
                            .font(.system(size: height / 35))
                            .foregroundColor(.white)
                    }
            }
        }
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView(action: { })
    }
}
