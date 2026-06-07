//
//  MonitoringDetailPanel.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import SwiftUI

struct MonitoringDetailPanel: View {
    let station: MonitoringStation
    let onClose: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            // Panel Header
            HStack {
                HStack(spacing: 12) {
                    ZStack {
                        Circle()
                            .fill(station.color.opacity(0.2))
                            .frame(width: 44, height: 44)
                        
                        Image(systemName: station.icon)
                            .foregroundStyle(station.color)
                            .font(.title3)
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(station.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        Text(station.status)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(station.statusColor)
                    }
                }
                
                Spacer()
                
                // Close button
                Button(action: onClose) {
                    Image(systemName: "xmark")
                        .font(.body)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(Color.white.opacity(0.1))
                        .clipShape(Circle())
                }
                .buttonStyle(.plain)
                .hoverEffect()
            }
            
            Divider()
                .background(station.color.opacity(0.3))
            
            // Detailed Child Update
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("NURSERY UPDATE")
                        .font(.caption)
                        .fontWeight(.heavy)
                        .foregroundStyle(station.color)
                    Spacer()
                }
                
                Text(station.detailText)
                    .font(.body)
                    .foregroundStyle(.white)
                    .lineSpacing(4)
            }
            .padding(14)
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // Grid of notes (Staff note & Safety note)
            HStack(alignment: .top, spacing: 14) {
                // Staff note card
                VStack(alignment: .leading, spacing: 6) {
                    Label("Keyworker Note", systemImage: "pencil.line")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(.purple)
                    
                    Text(station.staffNote)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .lineSpacing(2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12)
                .background(Color.purple.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                // Safety note card
                VStack(alignment: .leading, spacing: 6) {
                    Label("Safety & Wellbeing", systemImage: "checkmark.shield.fill")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(.green)
                    
                    Text(station.safetyNote)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .lineSpacing(2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12)
                .background(Color.green.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            // Parent Value Section
            HStack(spacing: 8) {
                Image(systemName: "hand.heart.fill")
                    .foregroundStyle(.pink)
                
                Text("PARENT VALUE: \(station.parentValue)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.pink)
            }
            .padding(.top, 4)
        }
        .padding(24)
        .frame(width: 520)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(
                    LinearGradient(
                        colors: [station.color.opacity(0.6), .purple.opacity(0.3), .clear],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1.5
                )
        )
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

#Preview {
    MonitoringDetailPanel(
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
            detailText: "Olivia ate all of her morning snack and most of her lunch (pasta). She had two cups of water and was very happy during lunch.",
            parentValue: "Healthy Nutrition Intake",
            staffNote: "Olivia enjoyed her food and washed her hands carefully.",
            safetyNote: "Staff checked checklist: No allergy warnings today."
        ),
        onClose: {}
    )
    .padding()
}
