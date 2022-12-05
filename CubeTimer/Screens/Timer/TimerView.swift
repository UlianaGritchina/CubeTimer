import SwiftUI

struct TimerView: View {
    @StateObject var vm = TimerViewModel()
    @Environment(\.verticalSizeClass) var heightClass: UserInterfaceSizeClass?
    var body: some View {
        ZStack {
            NavigationView {
                GeometryReader { geometry in
                    ZStack {
                        VStack {
                            StopwatchView(stopwatch: vm.stopwatch)
                            Text(vm.scramble)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .padding()
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
                    SavedView().opacity(vm.isShowingSaveView ? 1 : 0)
                }
                .preferredColorScheme(.dark)
            }
            .onAppear {
                vm.getResults()
                vm.setScrambel()
                vm.setLanguage()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

extension TimerView {
    
    private var buttons: some View {
        HStack {
            ButtonView(title: vm.getSaveTitle(), color: Color("green"), action: vm.saveResult)
                .padding(.trailing)
            Spacer()
            ButtonView(title: vm.getRestTitle(), color:  Color("red"), action: vm.rest)
                .padding(.leading)
        }
        .padding(.bottom)
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
            buttons.padding(.horizontal)
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
