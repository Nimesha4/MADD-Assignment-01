//
//  IncidentReportCard.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import SwiftUI

struct IncidentReportCard: View {
    let incidentStatus: String
    let minorNote: String
    let staffAction: String
    let parentVisibilityNote: String
    
    var body: some View {
        VisionCard(title: "Incident Tracking", icon: "exclamationmark.triangle.fill", headerColor: .orange) {
            VStack(alignment: .leading, spacing: 10) {
                // Today's Incident Status
                HStack(spacing: 8) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                    
                    Text(incidentStatus)
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                }
                .padding(.bottom, 4)
                
                // Details
                VStack(alignment: .leading, spacing: 6) {
                    Text("MINOR LOG:")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.orange)
                    
                    Text(minorNote)
                        .font(.subheadline)
                        .foregroundStyle(.primary)
                        .lineLimit(2)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("STAFF ACTION:")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.orange)
                    
                    Text(staffAction)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Spacer(minLength: 0)
                
                // Parent Report Note
                HStack(spacing: 6) {
                    Image(systemName: "doc.plaintext.fill")
                        .foregroundStyle(.orange)
                    
                    Text(parentVisibilityNote)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 4)
            }
        }
    }
}

#Preview {
    IncidentReportCard(
        incidentStatus: "No serious incident",
        minorNote: "Small bump during outdoor play",
        staffAction: "Checked and monitored",
        parentVisibilityNote: "Report available for review"
    )
    .frame(width: 320, height: 250)
    .padding()
}
