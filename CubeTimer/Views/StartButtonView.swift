import SwiftUI

struct StartButtonView: View {
    let action: () -> ()
    let width: CGFloat
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
                    .frame(width:  width,
                           height:  width)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 3, y: 5)
                
                Circle()
                    .frame(width:  width - 10,
                           height:  width - 10)
                    .opacity(0)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
                    .overlay {
                        Image(systemName: "eject.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
            }
        }
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView(action: { }, width: 100)
    }
}
