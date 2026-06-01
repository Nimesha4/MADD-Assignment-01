//
//  IncidentDetailView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-05-31.
//

import SwiftUI

struct IncidentDetailView: View {
    
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var incidentVM: IncidentViewModel
    let incident: Incident

    var body: some View {

        ScrollView {

            VStack(spacing: 20) {

                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.orange)

                Text(incident.title)
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)

                VStack(alignment: .leading, spacing: 15) {

                    Label(
                        "Child: \(incident.childName)",
                        systemImage: "person.fill"
                    )

                    Divider()

                    Text("Incident Description")
                        .font(.headline)

                    Text(incident.details)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.regularMaterial)
                .cornerRadius(16)

                VStack(alignment: .leading, spacing: 10) {

                    Text("Safety Notes")
                        .font(.headline)

                    Text("""
                    This incident has been recorded for monitoring and follow-up purposes. Nursery staff should review the details and ensure appropriate action has been taken.
                    """)
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.regularMaterial)
                .cornerRadius(16)

                Button {

                    incidentVM.resolveIncident(incident)

                    dismiss()

                } label: {

                    Label(
                        "Mark as Resolved",
                        systemImage: "checkmark.circle.fill"
                    )
                }
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Incident Details")
    }
}
