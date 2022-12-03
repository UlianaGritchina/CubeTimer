//
//  StarterView.swift
//  CubeTimer
//
//  Created by Ульяна Гритчина on 30.11.2022.
//

import SwiftUI

struct StarterView: View {
    @State private var isStart = false
    @State private var isEnd = false
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
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.black)
                .overlay {
                    VStack {
                        Spacer()
                        Image(isStart ? "logo2": "logo")
                            .resizable()
                            .frame(
                                width: UIScreen.main.bounds.width / 2.5,
                                height: UIScreen.main.bounds.width / 2.5
                            )
                            .cornerRadius(10)
                            .rotationEffect(Angle(degrees: isStart ? 360 : 0))
                        Spacer()
                    }
                }
                .opacity(isEnd ? 0 : 1)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.spring()) {
                            isStart.toggle()
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            isEnd.toggle()
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
