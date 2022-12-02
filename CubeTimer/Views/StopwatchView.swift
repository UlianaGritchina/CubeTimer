import SwiftUI

struct StopwatchView: View {
    let stopwatch: Stopwatch
    var body: some View {
        HStack {
            Text("\(stopwatch.min)")
                .frame(width: 80)
            Text(":")
            Text("\(stopwatch.seconds)")
                .frame(width: 80)
            Text(",")
            Text("\(stopwatch.milliseconds)")
                .frame(width: 80)
        }
        .font(.system(size: 50))
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray)
                .opacity(0.5)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
        }
        
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView(
            stopwatch: Stopwatch(
                min: 0,
                seconds: 0,
                milliseconds: 0
            )
        )
    }
}
