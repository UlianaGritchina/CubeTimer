import SwiftUI

struct StarterView: View {
    @StateObject var vm = StarterViewModel()
    var body: some View {
        ZStack {
            TabView {
                TimerView()
                    .tabItem {
                        Label("Main", systemImage: "clock")
                    }
                ResultsView(deleteAction: {})
                    .tabItem {
                        Label("Results", systemImage: "list.dash")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
            Color.black.ignoresSafeArea()
                .overlay {
                    VStack {
                        Spacer()
                        Image(vm.isStart ? "logo2" : "logo")
                            .resizable()
                            .frame(
                                width: UIScreen.main.bounds.width / 2.5,
                                height: UIScreen.main.bounds.width / 2.5
                            )
                            .cornerRadius(10)
                            .rotationEffect(Angle(degrees: vm.isStart ? 360 : 0))
                        Spacer()
                    }
                }
                .opacity(vm.isEnd ? 0 : 1)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.spring()) {
                            vm.isStart.toggle()
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            vm.isEnd.toggle()
                        }
                    }
                }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
