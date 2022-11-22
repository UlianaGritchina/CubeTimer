import SwiftUI

struct TimerView: View {
    @StateObject var vm = TimerViewModel()
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        NavigationView {
            VStack {
                StopwatchView(stopwatch: vm.stopwatch)
                Spacer()
                HStack {
                    startButton(side: .left)
                    Spacer()
                    startButton(side: .right)
                }
                .padding(.horizontal)
            }
            .padding()
            .navigationTitle("Cube Timer")
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
    
    private func startButton(side: Side) -> some View {
        Button(action: { vm.startOrStopStopwatch(side) }) {
            Circle()
                .frame(width: width / 3.5, height: width / 3.5)
                .foregroundColor(.yellow)
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 3, y: 5)
                .overlay {
                    Image(systemName: "eject.fill")
                        .font(.system(size: height / 35))
                        .foregroundColor(.black)
                }
        }
    }
    
}
