import SwiftUI

@main
struct CubeTimerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                TimerView()
                    .tabItem {
                        Label("Main", systemImage: "clock")
                    }
                ResultsView(deleteAction: {})
                    .tabItem {
                        Label("Results", systemImage: "list.dash")
                    }
                
                Color.blue
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}
