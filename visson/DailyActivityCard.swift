//
//  DailyActivityCard.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import SwiftUI

struct DailyActivityCard: View {
    let activities: [String]
    
    // Map activities to SF symbols for visual storytelling
    private func icon(for activity: String) -> String {
        switch activity.lowercased() {
        case let x where x.contains("circle"): return "person.3.sequence.fill"
        case let x where x.contains("outdoor"): return "figure.outdoor.cycle"
        case let x where x.contains("story"): return "book.closed.fill"
        case let x where x.contains("painting") || x.contains("creative"): return "paintpalette.fill"
        case let x where x.contains("nap") || x.contains("sleep"): return "moon.zzz.fill"
        default: return "star.fill"
        }
    }
    
    // Color coding for activity progress
    private func color(for index: Int) -> Color {
        let colors: [Color] = [.purple, .orange, .blue, .pink, .indigo]
        return colors[index % colors.count]
    }
    
    var body: some View {
        VisionCard(title: "Daily Activity", icon: "square.grid.3x1.folder.badge.plus", headerColor: .blue) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(0..<activities.count, id: \.self) { index in
                        HStack(alignment: .top, spacing: 14) {
                            // Timeline line & circle
                            VStack(spacing: 0) {
                                Circle()
                                    .fill(color(for: index))
                                    .frame(width: 12, height: 12)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                                
                                if index < activities.count - 1 {
                                    Rectangle()
                                        .fill(color(for: index).opacity(0.3))
                                        .frame(width: 2, height: 32)
                                }
                            }
                            
                            // Activity details
                            HStack(spacing: 8) {
                                Image(systemName: icon(for: activities[index]))
                                    .foregroundStyle(color(for: index))
                                    .font(.footnote)
                                
                                Text(activities[index])
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.primary)
                            }
                            .padding(.top, -2)
                            
                            Spacer()
                        }
                    }
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 6)
            }
        }
    }
}

#Preview {
    DailyActivityCard(activities: [
        "Morning circle",
        "Outdoor play",
        "Story time",
        "Creative painting",
        "Nap time"
    ])
    .frame(width: 320, height: 260)
    .padding()
}
