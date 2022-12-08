import SwiftUI

struct ResultsView: View {
    @StateObject var vm = ResultsViewModel()
    let deleteAction: () -> ()
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    if  vm.isResultsExists {
                        resultsList
                    } else {
                        noResultsMessageView
                    }
                }
                .navigationTitle(vm.getMainTitle())
            }
        }
        .onAppear {
            vm.getResults()
            vm.getBestResult()
            vm.setLanguage()
        }
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
        Text(vm.getNoResultsTitle())
            .font(.headline)
    }
    
}
