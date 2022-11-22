import SwiftUI

struct StopwatchView: View {
    let stopwatch: Stopwatch
    var body: some View {
        HStack {
            Text("\(stopwatch.min)")
                .scaledToFit()
            Text(":")
            Text("\(stopwatch.seconds)")
                .frame(width: 80)
            Text(",")
            Text("\(stopwatch.milliseconds)")
                .frame(width: 80)
            
        }
        .font(.system(size: 60))
        .foregroundColor(.green)
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
