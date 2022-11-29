import SwiftUI

struct TimerView: View {
    @StateObject var vm = TimerViewModel()
    @Environment(\.verticalSizeClass) var heightClass: UserInterfaceSizeClass?
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    BackgroundView(color: .green)
                    VStack {
                        StopwatchView(stopwatch: vm.stopwatch)
                        Spacer()
                        if heightClass == .regular {
                            portraitArientationStartButtons(geometry: geometry)
                        } else if heightClass == .compact {
                            landscapeStartButtons(geometry: geometry)
                        }
                    }
                    .padding()
                    .navigationTitle("Cube Timer")
                }
            }
            .toolbar {
                NavigationLink(destination: ResultsView(deleteAction: vm.getResults)) {
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
            ButtonView(title: "Save", color: .blue, action: vm.addResult)
                .padding()
            ButtonView(title: "Rest", color: .red, action: vm.rest)
                .padding()
        }
        .opacity(vm.isShowingButtons ? 1 : 0)
    }
    
    private func portraitArientationStartButtons(geometry: GeometryProxy) -> some View {
        VStack {
            buttons.padding(.bottom)
            HStack {
                StartButtonView(
                    action: vm.startOrStopStopwatch,
                    width: heightClass == .compact
                    ? geometry.size.width / 6
                    : geometry.size.width / 3
                )
                Spacer()
                StartButtonView(
                    action: {},
                    width: heightClass == .compact
                    ? geometry.size.width / 6
                    : geometry.size.width / 3
                )
            }
        }
    }
    
    private func landscapeStartButtons(geometry: GeometryProxy) -> some View {
        HStack {
            StartButtonView(
                action: vm.startOrStopStopwatch,
                width: heightClass == .compact
                ? geometry.size.width / 6
                : geometry.size.width / 3
            )
            Spacer()
            buttons
            Spacer()
            StartButtonView(
                action: {},
                width: heightClass == .compact
                ? geometry.size.width / 6
                : geometry.size.width / 3
            )
        }
    }
    
}
