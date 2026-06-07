//
//  AttendanceCard.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import SwiftUI

struct AttendanceCard: View {
    let todayStatus: String
    let dropOffTime: String
    let pickUpPerson: String
    let sessionType: String
    
    var body: some View {
        VisionCard(title: "Attendance Monitoring", icon: "checkmark.shield.fill", headerColor: .green) {
            VStack(alignment: .leading, spacing: 12) {
                // Today's Status Header Badge
                HStack {
                    Text("Today's Status:")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Circle()
                            .fill(.green)
                            .frame(width: 8, height: 8)
                        
                        Text(todayStatus.uppercased())
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(.green)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.green.opacity(0.15))
                    .clipShape(Capsule())
                }
                
                // Attendance Details
                VStack(spacing: 8) {
                    HStack {
                        Label("Drop-off Time", systemImage: "clock.arrow.circlepath")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text(dropOffTime)
                            .fontWeight(.medium)
                    }
                    
                    HStack {
                        Label("Pick-up Person", systemImage: "person.2.fill")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text(pickUpPerson)
                            .fontWeight(.medium)
                    }
                    
                    HStack {
                        Label("Nursery Session", systemImage: "calendar.badge.clock")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text(sessionType)
                            .fontWeight(.medium)
                    }
                }
                .font(.body)
                
                Spacer(minLength: 0)
                
                // Safe and Verified Footer
                HStack(spacing: 6) {
                    Image(systemName: "lock.shield.fill")
                        .foregroundStyle(.green)
                    
                    Text("Secure check-in verified by staff")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 6)
            }
        }
    }
}

#Preview {
    AttendanceCard(
        todayStatus: "Present",
        dropOffTime: "8:25 AM",
        pickUpPerson: "Mother",
        sessionType: "Full Day"
    )
    .frame(width: 320, height: 250)
    .padding()
}
