//
//  ContentView.swift
//  NurseryConnectVision
//
//  Created by Nimesha Jayawickrama on 2026-06-01.
//

import SwiftUI
import Charts

struct ContentView: View {

    let analyticsData = [
        AnalyticsItem(category: "Attendance", value: 92),
        AnalyticsItem(category: "Meals", value: 95),
        AnalyticsItem(category: "Safety", value: 98)
    ]

    var body: some View {

        NavigationStack {

            VStack(alignment: .leading, spacing: 25) {

                // HEADER

                VStack(alignment: .leading, spacing: 10) {

                    Label(
                        "NurseryConnect Vision",
                        systemImage: "visionpro"
                    )
                    .font(.largeTitle)
                    .fontWeight(.bold)

                    Text("Spatial Nursery Management Dashboard")
                        .foregroundStyle(.secondary)

                    HStack(spacing: 20) {

                        Label(
                            "Live",
                            systemImage: "dot.radiowaves.left.and.right"
                        )
                        .foregroundStyle(.green)

                        Label(
                            "Connected",
                            systemImage: "wifi"
                        )
                        .foregroundStyle(.blue)
                    }
                    .font(.caption)
                }

                Divider()

                HStack(alignment: .top, spacing: 25) {

                    // LEFT SIDE

                    VStack(spacing: 20) {

                        NavigationLink {
                            ChildrenVisionView()
                        } label: {
                            DashboardCard(
                                title: "Children Present",
                                value: "18",
                                icon: "person.3.fill"
                            )
                        }

                        NavigationLink {
                            AttendanceVisionView()
                        } label: {
                            DashboardCard(
                                title: "Attendance",
                                value: "92%",
                                icon: "chart.bar.fill"
                            )
                        }

                        GlassInfoCard(
                            title: "Recent Activity",
                            lines: [
                                "Emma Checked In",
                                "Parent Pickup Confirmed",
                                "Outdoor Session Started"
                            ]
                        )
                    }

                    // CENTER ANALYTICS

                    VStack(spacing: 20) {

                        Text("Nursery Analytics")
                            .font(.title2)
                            .fontWeight(.bold)

                        Chart(analyticsData) { item in

                            BarMark(
                                x: .value("Category", item.category),
                                y: .value("Value", item.value)
                            )
                        }
                        .frame(height: 260)

                        Text("Real-time nursery performance overview")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .glassBackgroundEffect()

                    // RIGHT SIDE

                    VStack(spacing: 20) {

                        NavigationLink {
                            IncidentVisionView()
                        } label: {
                            DashboardCard(
                                title: "Incidents",
                                value: "1",
                                icon: "exclamationmark.triangle.fill"
                            )
                        }

                        NavigationLink {
                            MealsVisionView()
                        } label: {
                            DashboardCard(
                                title: "Meals",
                                value: "95%",
                                icon: "fork.knife"
                            )
                        }

                        GlassInfoCard(
                            title: "Today's Summary",
                            lines: [
                                "18 Children Present",
                                "1 Minor Incident",
                                "95% Meals Completed"
                            ]
                        )
                    }
                }
            }
            .padding(40)
        }
    }
}

struct AnalyticsItem: Identifiable {

    let id = UUID()
    let category: String
    let value: Int
}

struct GlassInfoCard: View {

    let title: String
    let lines: [String]

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text(title)
                .font(.headline)

            ForEach(lines, id: \.self) { line in

                Label(
                    line,
                    systemImage: "circle.fill"
                )
                .font(.caption)
            }
        }
        .frame(width: 280)
        .padding()
        .glassBackgroundEffect()
    }
}

#Preview {
    ContentView()
}
