import SwiftUI

struct ResultRow: View {
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    @State private var isShowingSheet = false
    let result: Result
    let deleteAction: () -> ()
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
                        Text(result.time)
                            .font(.title)
                        Text(result.date)
                            .font(.title2)
                    }
                    Spacer()
                    Button(action: {isShowingSheet.toggle()}) {
                        Image(systemName: "ellipsis")
                    }
                }
                    .padding()
            )
            .actionSheet(isPresented: $isShowingSheet) {
                ActionSheet(
                    title: Text("Do you want to delete result?"),
                    buttons: [
                        .destructive(Text("Delete")) {
                            deleteAction()
                        },
                        .cancel()
                    ]
                )
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
