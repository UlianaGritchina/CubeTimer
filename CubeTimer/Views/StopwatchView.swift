import SwiftUI

struct StopwatchView: View {
    let stopwatch: Stopwatch
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(.gray)
            .frame(maxWidth: 600)
            .frame(height: 80)
            .opacity(0.5)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .overlay(
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
                    .foregroundColor(.white)
                    .padding()
            )
        
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
