import SwiftUI

struct ResultRow: View {
    @StateObject var vm = ResultRowViewModel()
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    let result: Result
    let deleteAction: () -> ()
    var body: some View {
        rowRectangle
            .overlay(
                HStack {
                    rowContent
                    Spacer()
                    Button(action: vm.showSheet) {
                        Image(systemName: "ellipsis")
                            .padding()
                    }
                }
                    .padding()
            )
            .actionSheet(isPresented: $vm.isShowingSheet) { actionSheet() }
            .onAppear {
                vm.setLanguage()
            }
    }
}

struct ResultRow_Previews: PreviewProvider {
    static var previews: some View {
        ResultRow(
            result: Result(time: "20 : 03 , 45", date: "11,12,12", times: []),
            deleteAction: {}
        )
    }
}

extension ResultRow {
    
    private var rowRectangle: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(.gray)
            .frame(width: width - 40, height: 80)
            .opacity(0.5)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
    }
    
    private var rowContent: some View {
        VStack(alignment: .leading) {
            Text(result.time)
                .font(.title)
            Text(result.date)
                .font(.title2)
        }
    }
    
    private func actionSheet() -> ActionSheet {
        ActionSheet(
            title: Text(vm.getText(result: result)),
            buttons: [
                .destructive(Text(vm.getButtonTitle())) {
                    deleteAction()
                },
                .cancel()
            ]
        )
    }
    
}
