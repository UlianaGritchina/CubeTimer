import SwiftUI

struct ButtonView: View {
    let title: String
    let color: Color
    let action: () -> ()
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(color)
                .padding(.horizontal)
        }
        .buttonStyle(RectangelButtonStyle())
    }
}

struct StrokeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "title", color: .orange, action: {})
    }
}
