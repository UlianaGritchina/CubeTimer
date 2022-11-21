import SwiftUI

struct TimerView: View {
    @StateObject var vm = TimerViewModel()
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        NavigationView {
            VStack {
                timer
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
    
    private var timer: some View {
        Text("\(vm.timeRemaining)")
            .font(.system(size: height / 15))
            .bold()
            .foregroundColor(.green)
            .onReceive(vm.timer) { _ in vm.startCount()  }
    }
    
    private func startButton(side: Side) -> some View {
        Button(action: { vm.startOrStopTimer(side) }) {
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
