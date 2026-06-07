//
//  DevelopmentProgressChart.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import SwiftUI
import Charts

struct DevelopmentProgressChart: View {
    let progressData: [DevelopmentProgress]
    
    var body: some View {
        VisionCard(title: "Development Progress", icon: "chart.bar.fill", headerColor: .pink) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Weekly Skill Assessment (EYFS)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Chart {
                    ForEach(progressData) { data in
                        BarMark(
                            x: .value("Area", data.area),
                            y: .value("Progress %", data.score)
                        )
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.pink.opacity(0.8), .purple.opacity(0.7)],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .cornerRadius(6)
                        // Add values on top of the bars
                        .annotation(position: .top, alignment: .center) {
                            Text("\(Int(data.score))%")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .chartYScale(domain: 0...100)
                .chartYAxis {
                    AxisMarks(position: .leading, values: [0, 25, 50, 75, 100]) { value in
                        AxisGridLine()
                            .foregroundStyle(.white.opacity(0.1))
                        AxisValueLabel {
                            if let intVal = value.as(Int.self) {
                                Text("\(intVal)%")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .chartXAxis {
                    AxisMarks { value in
                        AxisValueLabel {
                            if let areaStr = value.as(String.self) {
                                // Shorten some names to prevent wrapping issues on small screens
                                Text(shortenAreaName(areaStr))
                                    .font(.system(size: 9))
                                    .fontWeight(.medium)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .frame(height: 120)
                
                Spacer(minLength: 0)
            }
        }
    }
    
    private func shortenAreaName(_ name: String) -> String {
        switch name {
        case "Communication": return "Comm"
        case "Independence": return "Indep"
        default: return name
        }
    }
}

#Preview {
    DevelopmentProgressChart(progressData: [
        DevelopmentProgress(area: "Communication", score: 85),
        DevelopmentProgress(area: "Physical", score: 90),
        DevelopmentProgress(area: "Social", score: 80),
        DevelopmentProgress(area: "Creative", score: 95),
        DevelopmentProgress(area: "Independence", score: 75)
    ])
    .frame(width: 320, height: 260)
    .padding()
}
