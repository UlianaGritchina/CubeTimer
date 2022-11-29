import SwiftUI

struct SavedView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Rectangle()
                    .frame(width: 150, height: 150)
                    .opacity(0)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .overlay {
                        Text("Saved")
                            .font(.headline)
                    }
                Spacer()
            }
            Spacer()
            Spacer()
        }
    }
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}
