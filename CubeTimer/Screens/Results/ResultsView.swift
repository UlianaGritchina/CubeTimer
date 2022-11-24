import SwiftUI

struct ResultsView: View {
    @StateObject var vm = ResultsViewModel()
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        ScrollView {
            ForEach((vm.results), id: \.self) {_ in
                ResultRow().padding()
            }
        }
        .navigationTitle("Results")
    }
}

struct Results_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
