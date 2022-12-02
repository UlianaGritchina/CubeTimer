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
            ButtonView(title: "Save", color: Color("Blue"), action: vm.saveResult)
                .padding(.trailing)
            Spacer()
            ButtonView(title: "Rest", color:  Color("Red"), action: vm.rest)
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
