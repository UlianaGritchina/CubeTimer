import SwiftUI

struct TimerView: View {
    @StateObject var vm = TimerViewModel()
    @Environment(\.verticalSizeClass) var heightClass: UserInterfaceSizeClass?
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                GeometryReader { geometry in
                    VStack {
                        StopwatchView(stopwatch: vm.stopwatch)
                        scramble.padding()
                        Spacer()
                        startButtons(geometry: geometry)
                    }
                    .padding()
                    .navigationTitle("Cube Timer")
                }
                SavedView().opacity(vm.isShowingSaveView ? 1 : 0)
            }
        }
        .preferredColorScheme(.dark)
        .onAppear { vm.setupView() }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

extension TimerView {
    
    private var scramble: some View {
        Text(vm.scramble)
            .font(.title2)
            .multilineTextAlignment(.center)
    }
    
    private var saveRestButtons: some View {
        HStack {
            ButtonView(
                title: vm.getSaveTitle(),
                color: Color("green"),
                action: vm.saveResult
            )
            Spacer()
            ButtonView(
                title: vm.getRestTitle(),
                color:  Color("Red"),
                action: vm.rest
            )
        }
        .opacity(vm.isShowingButtons ? 1 : 0)
        .padding()
    }
    
    private func portraitArientationStartButtons(geometry: GeometryProxy) -> some View {
        VStack {
            saveRestButtons.padding(.bottom)
            HStack {
                StartButtonView(
                    action: vm.startOrStopStopwatch,
                    width: heightClass == .compact
                    ? geometry.size.width / 7
                    : geometry.size.width / 3
                )
                Spacer()
                StartButtonView(
                    action: {},
                    width: heightClass == .compact
                    ? geometry.size.width / 7
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
            saveRestButtons.padding(.horizontal)
            Spacer()
            StartButtonView(
                action: {},
                width: heightClass == .compact
                ? geometry.size.width / 6
                : geometry.size.width / 3
            )
        }
    }
    
    private func startButtons(geometry: GeometryProxy) -> some View {
        VStack {
            if heightClass == .regular {
                portraitArientationStartButtons(
                    geometry: geometry
                )
            } else if heightClass == .compact {
                landscapeStartButtons(geometry: geometry)
            }
        }
    }
    
}
