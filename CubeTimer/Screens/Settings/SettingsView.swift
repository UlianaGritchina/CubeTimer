//
//  SettingsView.swift
//  CubeTimer
//
//  Created by Ульяна Гритчина on 03.12.2022.
//

import SwiftUI

enum Cube: String {
    case three = "3x3"
    case fore = "4x4"
    case five = "5x5"
}

enum Language: String, Codable {
    case eng = "Eng"
    case rus = "Rus"
    case spain = "Es"
}

class SettingsViewModel: ObservableObject {
    
    @Published var selectedLeng: Language = .eng
    @Published var scramble = UserDefaultsManager.shared.getIsScrsmbrl()
    
    init() {
        setLanguage()
    }
    
    func saveScrubble(_ value: Bool) {
        UserDefaultsManager.shared.setIsScrambel(scramble)
    }
    
    func setLanguage() {
        selectedLeng = UserDefaultsManager.shared.getLanguage()
    }
    
    func getMainTitle() -> String {
        switch selectedLeng {
        case .eng: return "Settings"
        case .rus: return "Настройки"
        case .spain: return "Ajustes"
        }
    }
    
    func getLengTitle() -> String {
        switch selectedLeng {
        case .eng: return "Language"
        case .rus: return "Язык"
        case .spain: return "Idioma"
        }
    }
    
    func getScrubleTitle() -> String {
        switch selectedLeng {
        case .eng: return "Show scramble"
        case .rus: return "Показывать скрамбл"
        case .spain: return "Mostrar scramble"
        }
    }
    
}

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
            }
            .padding()
            .navigationTitle(vm.getMainTitle())
        }
        .preferredColorScheme(.dark)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

