//
//  IncidentListView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-05-31.
//

import SwiftUI

struct IncidentListView: View {

    @EnvironmentObject var incidentVM: IncidentViewModel

    var body: some View {

        List {

            if incidentVM.incidents.isEmpty {

                ContentUnavailableView(
                    "No Incidents",
                    systemImage: "exclamationmark.triangle",
                    description: Text("Add an incident using the + button")
                )

            } else {

                ForEach(incidentVM.incidents) { incident in

                    NavigationLink {

                        IncidentDetailView(
                            incident: incident
                        )
                        .environmentObject(incidentVM)

                    } label: {

                        VStack(alignment: .leading, spacing: 8) {

                            HStack {

                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.orange)

                                Text(incident.title)
                                    .font(.headline)

                                Spacer()
                            }

                            Text("Child: \(incident.childName)")
                                .font(.subheadline)

                            Text(incident.details)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .lineLimit(2)
                        }
                        .padding(.vertical, 6)
                    }
                }
            }
        }
        .navigationTitle("Incidents")
        .toolbar {

            NavigationLink {

                AddIncidentView()
                    .environmentObject(incidentVM)

            } label: {

                Image(systemName: "plus")
            }
        }
    }
}
