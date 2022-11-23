import SwiftUI

struct StrokeButtonView: View {
    let title: String
    let color: Color
    let action: () -> ()
    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 10)
                .stroke()
                .frame(maxWidth: 350)
                .frame(height: 45)
                .foregroundColor(color)
                .overlay {
                    Text(title)
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                }
        }
    }
}

struct StrokeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StrokeButtonView(title: "title", color: .orange, action: {})
    }
}
