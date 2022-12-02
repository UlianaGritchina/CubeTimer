import SwiftUI

struct ResultsView: View {
    @StateObject var vm = ResultsViewModel()
    let deleteAction: () -> ()
    var body: some View {
        NavigationView {
            VStack {
                if  vm.isResultsExists {
                    resultsList
                } else {
                    noResultsMessageView
                }
            }
            .navigationTitle("Results")
        }
        .onAppear {
            vm.getResults()
            vm.getBestResult()
        }
        .preferredColorScheme(.dark)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Results_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(deleteAction: {})
    }
}

extension ResultsView {
    
    private var resultsList: some View {
        ScrollView {
            if vm.bestResult != nil {
                BestResultRow(result: vm.bestResult!).padding()
            }
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
    }
    
    private var noResultsMessageView: some View {
        Text("No saved results")
            .font(.headline)
    }
    
}
