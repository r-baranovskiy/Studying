import SwiftUI
import Charts

struct ContentView: View {
    let viewMonths: [ViewMonth] = [
        .init(date: Date.from(year: 2023, month: 1, day: 1), viewCount: 55000),
        .init(date: Date.from(year: 2023, month: 2, day: 1), viewCount: 89000),
        .init(date: Date.from(year: 2023, month: 3, day: 1), viewCount: 64000),
        .init(date: Date.from(year: 2023, month: 4, day: 1), viewCount: 79000),
        .init(date: Date.from(year: 2023, month: 5, day: 1), viewCount: 130000),
        .init(date: Date.from(year: 2023, month: 6, day: 1), viewCount: 90000),
        .init(date: Date.from(year: 2023, month: 7, day: 1), viewCount: 88000),
        .init(date: Date.from(year: 2023, month: 8, day: 1), viewCount: 64000),
        .init(date: Date.from(year: 2023, month: 9, day: 1), viewCount: 74000),
        .init(date: Date.from(year: 2023, month: 10, day: 1), viewCount: 99000),
        .init(date: Date.from(year: 2023, month: 11, day: 1), viewCount: 110000),
        .init(date: Date.from(year: 2023, month: 12, day: 1), viewCount: 94000),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("YouTube Views")
            
            Text("Total: \(viewMonths.reduce(0, { $0 + $1.viewCount }))")
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .padding(.bottom, 12)
            
            Chart {
                RuleMark(y: .value("Goal", 80000))
                    .foregroundStyle(Color.mint)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                    .annotation(alignment: .leading) {
                        Text("Goal")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                
                ForEach(viewMonths) { viewMonth in
                    BarMark(x: .value("Month", viewMonth.date, unit: .month),
                            y: .value("Views", viewMonth.viewCount))
                }
                .foregroundStyle(Color.pink.gradient)
            }
            .frame(height: 180)
            .chartYScale(domain: 0...150_000)
            .chartXAxis(content: {
                AxisMarks(values: viewMonths.map { $0.date }) { date in
                    AxisValueLabel(format: .dateTime.month(.narrow),
                                   centered: true)
                }
            })
            //.chartXAxis(.hidden)
            .chartPlotStyle { plotContent in
                plotContent
                    .background(.black.gradient.opacity(0.3))
                    .border(.gray, width: 3)
            }
        }
    }
}


struct ViewMonth: Identifiable {
    let id = UUID()
    let date: Date
    let viewCount: Int
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components) ?? Date()
    }
}
