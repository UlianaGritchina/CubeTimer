import SwiftUI

struct StartButtonView: View {
    let action: () -> ()
    let width: CGFloat
    var body: some View {
        Button(action: action) {
            Circle()
                .frame(width: width)
                .foregroundColor(Color("background"))
                .overlay {
                    Text("Hold")
                        .font(.headline)
                        .foregroundColor(.blue.opacity(0.9))
                }
        }
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView(action: { }, width: 100)
    }
}
