import SwiftUI

struct TimerView: View {
    @StateObject var vm = TimerViewModel()
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    StopwatchView(stopwatch: vm.stopwatch)
                    Spacer()
                    buttons
                    
                    HStack(spacing: width / 3) {
                        startButton(side: .left)
                        startButton(side: .right)
                    }
                    .padding(.horizontal)
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
    
    private func startButton(side: Side) -> some View {
        Button(action: { vm.startOrStopStopwatch(side) }) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(width: width / 3.5, height: width / 3.5)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 3, y: 5)
                
                Circle()
                    .frame(width: width / 3.5 - 10, height: width / 3.5 - 10)
                    .opacity(0)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
                    .overlay {
                        Image(systemName: "eject.fill")
                            .font(.system(size: height / 35))
                            .foregroundColor(.white)
                    }
            }
        }
    }
    
    private var buttons: some View {
        VStack {
            StrokeButtonView(title: "Save", color: .blue, action: {})
                .padding()
            StrokeButtonView(title: "Rest", color: .red, action: vm.rest)
                .padding()
        }
        .opacity(vm.isShowingButtons ? 1 : 0)
    }
    
}
