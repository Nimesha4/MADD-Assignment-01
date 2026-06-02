//
//  IncidentVisionView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-06-01.
//

import SwiftUI

struct IncidentVisionView: View {

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 25) {

                VStack(alignment: .leading, spacing: 8) {

                    Text("Incident Management")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Monitor and review reported incidents")
                        .foregroundStyle(.secondary)
                }

                HStack(spacing: 20) {

                    IncidentSummaryCard(
                        title: "Open Incidents",
                        value: "1",
                        icon: "exclamationmark.triangle.fill"
                    )

                    IncidentSummaryCard(
                        title: "Resolved",
                        value: "12",
                        icon: "checkmark.shield.fill"
                    )
                }

                VStack(spacing: 15) {

                    IncidentCard(
                        title: "Minor Playground Incident",
                        child: "Sophia",
                        description: "Minor fall during outdoor play session.",
                        status: "Parent Notified"
                    )

                    IncidentCard(
                        title: "Medication Reminder",
                        child: "Emma",
                        description: "Scheduled medication administered successfully.",
                        status: "Completed"
                    )
                }

                IncidentInfoCard(
                    title: "Safety Summary",
                    lines: [
                        "1 Active Incident",
                        "12 Resolved Incidents",
                        "All Parents Notified",
                        "Safety Compliance Maintained"
                    ]
                )
            }
            .padding(30)
        }
        .navigationTitle("Incidents")
    }
}

struct IncidentSummaryCard: View {

    let title: String
    let value: String
    let icon: String

    var body: some View {

        VStack(spacing: 12) {

            Image(systemName: icon)
                .font(.system(size: 32))
                .foregroundStyle(.orange)

            Text(value)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(title)
                .font(.headline)
        }
        .frame(width: 220, height: 140)
        .glassBackgroundEffect()
    }
}

struct IncidentCard: View {

    let title: String
    let child: String
    let description: String
    let status: String

    var body: some View {

        VStack(alignment: .leading, spacing: 10) {

            Text(title)
                .font(.headline)

            Label(child, systemImage: "person.fill")

            Text(description)
                .foregroundStyle(.secondary)

            Label(
                status,
                systemImage: "checkmark.circle.fill"
            )
            .foregroundStyle(.green)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .glassBackgroundEffect()
    }
}

struct IncidentInfoCard: View {

    let title: String
    let lines: [String]

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text(title)
                .font(.headline)

            ForEach(lines, id: \.self) { line in

                Label(
                    line,
                    systemImage: "shield.fill"
                )
                .font(.caption)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .glassBackgroundEffect()
    }
}

#Preview {
    NavigationStack {
        IncidentVisionView()
    }
}
