import SwiftUI

struct ResultRow: View {
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(.gray)
            .frame(width: width - 40, height: 80)
            .opacity(0.5)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .overlay(
                HStack {
                    VStack(alignment: .leading) {
                        Text("0:20,5")
                            .font(.title)
                        Text("Date")
                            .font(.title2)
                    }
                    Spacer()
                }
                    .padding()
            )
    }
}

struct ResultRow_Previews: PreviewProvider {
    static var previews: some View {
        ResultRow()
    }
}
