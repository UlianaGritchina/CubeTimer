
import SwiftUI

struct BestResultRow: View {
    let result: Result
    let colors: [Color] = [.red, .blue, .white, .yellow, .orange, .green]
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: width - 40, height: 130)
            .opacity(0)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .overlay {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 0.7)
                        .foregroundColor(colors.randomElement() ?? .purple)
                    VStack {
                        Text("Best result")
                            .font(.headline)
                        Spacer()
                        Text(result.time)
                            .font(.system(size: height / 30))
                            .bold()
                        Spacer()
                        HStack {
                            Spacer()
                            Text(result.date)
                        }
                    }
                    .padding()
                }
            }
    }
}

struct BestResultRow_Previews: PreviewProvider {
    static var previews: some View {
        BestResultRow(result: Result(time: "time", date: "date", times: []))
    }
}
