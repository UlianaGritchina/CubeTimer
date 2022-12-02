import SwiftUI

struct ButtonView: View {
    let title: String
    let color: Color
    let action: () -> ()
    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(color)
                .frame(maxWidth: 300)
                .frame(height: 45)
                .cornerRadius(10)
                .overlay(
                    Text(title)
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                )
        }
    }
}

struct StrokeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "title", color: .orange, action: {})
    }
}
