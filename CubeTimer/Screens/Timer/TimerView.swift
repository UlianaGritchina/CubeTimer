import SwiftUI

struct TimerView: View {
    @StateObject var vm = TimerViewModel()
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView(color: .green)
                VStack {
                    StopwatchView(stopwatch: vm.stopwatch)
                    Spacer()
                    buttons.padding(.bottom)
                    
                    HStack {
                        StartButtonView(action: vm.startOrStopStopwatch)
                        Spacer()
                        StartButtonView(action: {})
                    }
                }
                .padding()
                .padding()
                .navigationTitle("Cube Timer")
            }
            .toolbar {
                NavigationLink(destination: ResultsView()) {
                    Image(systemName: "list.bullet")
                }
            }
            .preferredColorScheme(.dark)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

extension TimerView {
    
    private var buttons: some View {
        VStack {
            StrokeButtonView(title: "Save", color: .blue, action: vm.addResult)
                .padding()
            StrokeButtonView(title: "Rest", color: .red, action: vm.rest)
                .padding()
        }
        .opacity(vm.isShowingButtons ? 1 : 0)
    }
    
}
