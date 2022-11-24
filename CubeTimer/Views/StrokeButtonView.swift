import SwiftUI

struct StrokeButtonView: View {
    let title: String
    let color: Color
    let action: () -> ()
    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(color)
                .frame(maxWidth: 300)
                .frame(height: 45)
                .cornerRadius(10)
                .overlay(
                    Text(title)
                        .foregroundColor(color)
                        .font(.title2)
                        .padding()
                )
        }
    }
}

struct StrokeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StrokeButtonView(title: "title", color: .orange, action: {})
    }
}
