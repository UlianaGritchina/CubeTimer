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
        .font(.system(size: 40, weight: .medium, design: .monospaced))
        .foregroundColor(.blue.opacity(0.9))
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("background"))
                .shadow(
                    color: Color("shadowStart"),
                    radius: 10, x: 10, y: 10)
                .shadow(
                    color: Color("shadowEnd"),
                    radius: 10, x: -5, y: -5
                )
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
