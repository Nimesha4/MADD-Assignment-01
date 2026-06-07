//
//  MonitoringStationPanel.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import SwiftUI

struct MonitoringStationPanel: View {
    let station: MonitoringStation
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(systemName: station.icon)
                    .foregroundStyle(station.color)
                    .font(.headline)
                
                Text(station.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
            
            Text(station.summary)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(2)
            
            HStack {
                Text(station.status)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(station.statusColor)
                
                Spacer()
                
                // Select button
                Button(action: onTap) {
                    Text(isSelected ? "Selected" : "Tap for Details")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            isSelected ? Color.green.opacity(0.8) : Color.purple.opacity(0.6)
                        )
                        .clipShape(Capsule())
                }
                .buttonStyle(.plain)
            }
            .padding(.top, 4)
        }
        .padding(14)
        .frame(width: 240)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(
                    isSelected ? Color.green : station.color.opacity(0.5),
                    lineWidth: isSelected ? 2 : 1
                )
        )
        // Add visual scale animation when selected
        .scaleEffect(isSelected ? 1.05 : 1.0)
        .animation(.spring(response: 0.35, dampingFraction: 0.7), value: isSelected)
    }
}

#Preview {
    MonitoringStationPanel(
        station: MonitoringStation(
            id: "meal",
            title: "Meal Station",
            icon: "fork.knife",
            summary: "Lunch: Ate most of meal",
            status: "Good Hydration",
            statusColor: .purple,
            positionX: -0.6,
            positionY: 1.35,
            positionZ: -1.7,
            shapeType: .sphere,
            color: .purple,
            detailText: "Olivia ate all of her snack and most of her lunch.",
            parentValue: "Nutrition Verification",
            staffNote: "No allergy note today.",
            safetyNote: "Staff checked checklist."
        ),
        isSelected: false,
        onTap: {}
    )
    .padding()
}
