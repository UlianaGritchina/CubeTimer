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

struct SettingsView: View {
    @State private var scramble = false
    @State private var selectedCube: Cube = .three
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        NavigationView {
            VStack {
                Toggle("Show scramble", isOn: $scramble)
                
                HStack {
                    Text("Cube").font(.system(size: height / 30))
                    Spacer()
                }
                
                HStack() {
                    CubeTypeView(type: .three, selected: $selectedCube, color: .blue)
                        .padding()
                    CubeTypeView(type: .fore, selected: $selectedCube, color: .red)
                        .padding()
                    CubeTypeView(type: .five, selected: $selectedCube, color: .green)
                        .padding()
                }
                    
                Spacer()
            }
            .padding()
            .navigationTitle("Settings")
        }
        .preferredColorScheme(.dark)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

