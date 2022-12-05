import SwiftUI

struct SettingsView: View {
    @StateObject var vm = SettingsViewModel()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        NavigationView {
            VStack {
                Toggle(vm.getScrubleTitle(), isOn: $vm.scramble)
                    .onChange(of: vm.scramble) { newValue in
                        vm.saveScrubble(newValue)
                    }
                HStack {
                    Text(vm.getLengTitle()).font(.system(size: height / 30))
                    Spacer()
                }
                
                HStack() {
                    LanguageView(type: .eng, selected: $vm.selectedLeng, color: .blue)
                        .padding()
                    LanguageView(type: .rus, selected: $vm.selectedLeng, color: .green)
                        .padding()
                    LanguageView(type: .spain, selected: $vm.selectedLeng, color: .orange)
                        .padding()
                }
                Spacer()
                //                Link(destination: URL(string: "https://apps.apple.com/ru/app/mafia-gang/id1638964730")!) {
                //                    Text(vm.getRwviewTitle())
                //                        .bold()
                //                        .font(.system(size: height / 50))
                //                        .foregroundColor(.white)
                //                        .frame(width: width - 80, height: 50)
                //                        .background(Capsule().stroke())
                //                }
            }
            .padding()
            .navigationTitle(vm.getMainTitle())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(.dark)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

