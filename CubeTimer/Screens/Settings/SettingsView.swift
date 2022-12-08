import SwiftUI

struct SettingsView: View {
    @StateObject var vm = SettingsViewModel()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    Toggle(vm.getScrubleTitle(), isOn: $vm.scramble)
                        .onChange(of: vm.scramble) { newValue in
                            vm.saveScrubble(newValue)
                        }
                    languageView
                    Spacer()
                    suppurtButton
                        .padding(.bottom)
                }
                .padding()
                .navigationTitle(vm.getMainTitle())
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


extension SettingsView {
    
    private var suppurtButton: some View {
        Link(destination: URL(string: "https://apps.apple.com/ru/app/mafia-gang/id1638964730")!) {
            Text(vm.getRwviewTitle())
                .bold()
                .font(.system(size: height / 50))
                .frame(width: width - 80, height: 50)
                .background(Capsule().stroke())
                .foregroundColor(Color("selected"))
        }
    }
    
    private var languageView: some View {
        VStack {
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
        }
    }
    
}
