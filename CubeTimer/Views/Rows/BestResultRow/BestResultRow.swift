import SwiftUI

struct BestResultRow: View {
    @StateObject var vm = BestResultRowViewModel()
    let result: Result
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
                        .foregroundColor(vm.colors.randomElement() ?? .purple)
                    VStack {
                        Text(vm.getTitle())
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
            .onAppear {
                vm.setLanguage()
            }
    }
}

struct BestResultRow_Previews: PreviewProvider {
    static var previews: some View {
        BestResultRow(result: Result(time: "time", date: "date", times: []))
    }
}
