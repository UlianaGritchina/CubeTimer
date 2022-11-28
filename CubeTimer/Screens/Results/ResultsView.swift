import SwiftUI

struct ResultsView: View {
    @StateObject var vm = ResultsViewModel()
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            BackgroundView(color: .blue)
            ScrollView {
                ForEach((vm.results), id: \.self) { result in
                    ResultRow(result: result).padding()
                }
            }
            .navigationTitle("Results")
        }
    }
}

struct Results_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
