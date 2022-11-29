import SwiftUI

struct ResultsView: View {
    @StateObject var vm = ResultsViewModel()
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    let deleteAction: () -> ()
    var body: some View {
        ZStack {
            BackgroundView(color: .blue)
            ScrollView {
                ForEach((vm.results), id: \.self) { result in
                    ResultRow(result: result, deleteAction: {
                        withAnimation {
                            vm.delete(result)
                            deleteAction()
                        }
                    })
                    .padding()
                }
            }
            .navigationTitle("Results")
        }
    }
}

struct Results_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(deleteAction: {})
    }
}
