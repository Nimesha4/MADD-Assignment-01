//
//  PendingIncidentView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-06-01.
//

import SwiftUI

struct PendingIncidentView: View {

    @EnvironmentObject var incidentVM: IncidentViewModel

    var pendingIncidents: [Incident] {
        incidentVM.incidents.filter { $0.resolved == false }
    }

    var body: some View {

        List {

            Section {

                VStack(alignment: .leading, spacing: 12) {

                    Text("Incident Monitoring")
                        .font(.headline)

                    Text("""
                    This dashboard highlights unresolved incidents that require immediate attention from nursery staff. Monitoring pending incidents helps ensure child safety and maintain a secure nursery environment.
                    """)
                    .font(.caption)
                    .foregroundColor(.secondary)

                    ProgressView(
                        value: Double(pendingIncidents.count),
                        total: Double(max(incidentVM.totalIncidents, 1))
                    )
                    .tint(.orange)

                    Text(
                        "\(pendingIncidents.count) of \(incidentVM.totalIncidents) incidents remain unresolved."
                    )
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
                .padding(.vertical)
            }

            Section("Statistics") {

                HStack {

                    VStack {

                        Text("\(incidentVM.totalIncidents)")
                            .font(.title2)
                            .bold()

                        Text("Total")
                            .font(.caption)
                    }

                    Spacer()

                    VStack {

                        Text("\(pendingIncidents.count)")
                            .font(.title2)
                            .bold()

                        Text("Pending")
                            .font(.caption)
                    }

                    Spacer()

                    VStack {

                        Text("\(incidentVM.totalIncidents - pendingIncidents.count)")
                            .font(.title2)
                            .bold()

                        Text("Resolved")
                            .font(.caption)
                    }
                }
                .padding(.vertical, 5)
            }

            Section("Pending Incidents") {

                ForEach(pendingIncidents) { incident in

                    NavigationLink {

                        IncidentDetailView(
                            incident: incident
                        )
                        .environmentObject(incidentVM)

                    } label: {

                        VStack(alignment: .leading, spacing: 8) {

                            Text(incident.title)
                                .font(.headline)

                            Text("Child: \(incident.childName)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            Text(incident.details)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .lineLimit(2)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
        .navigationTitle("Pending Incidents")
    }
}
