//
//  DashboardView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-05-31.
//

import SwiftUI
import Charts

struct DashboardView: View {
    
    @ObservedObject var childVM: ChildViewModel
    @ObservedObject var incidentVM: IncidentViewModel
    
    @State private var pdfURL: URL?
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 20) {
                
                // Statistics Cards
                
                LazyVGrid(
                    columns: [GridItem(), GridItem()],
                    spacing: 12
                ) {
                    
                    DashboardCard(
                        title: "Children",
                        value: "\(childVM.children.count)",
                        icon: "person.3.fill"
                    )
                    
                    DashboardCard(
                        title: "Present",
                        value: "\(childVM.children.filter { $0.isPresent }.count)",
                        icon: "checkmark.circle.fill"
                    )
                    
                    NavigationLink {
                        
                        IncidentListView()
                            .environmentObject(incidentVM)
                        
                    } label: {
                        
                        DashboardCard(
                            title: "Incidents",
                            value: "\(incidentVM.totalIncidents)",
                            icon: "exclamationmark.triangle.fill"
                        )
                    }
                    
                    NavigationLink {
                        
                        PendingIncidentView()
                            .environmentObject(incidentVM)
                        
                    } label: {
                        
                        DashboardCard(
                            title: "Pending",
                            value: "\(incidentVM.unresolvedIncidents)",
                            icon: "clock.fill"
                        )
                    }
                }
                    
                    // Attendance Overview
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Attendance Overview")
                            .font(.headline)
                        
                        Label(
                            "Total Children: \(childVM.children.count)",
                            systemImage: "person.3.fill"
                        )
                        
                        Label(
                            "Present Today: \(childVM.children.filter { $0.isPresent }.count)",
                            systemImage: "checkmark.circle.fill"
                        )
                        
                        Label(
                            "Absent Today: \(childVM.children.filter { !$0.isPresent }.count)",
                            systemImage: "xmark.circle.fill"
                        )
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 5)
                    
                    
                HStack(alignment: .top, spacing: 12) {

                    VStack(alignment: .leading, spacing: 12) {

                        Text("Attendance Rate")
                            .font(.headline)

                        ProgressView(
                            value: Double(childVM.children.filter { $0.isPresent }.count),
                            total: Double(max(childVM.children.count, 1))
                        )
                        .tint(.green)

                        Text(
                            "\(childVM.children.filter { $0.isPresent }.count) of \(childVM.children.count) present"
                        )
                        .font(.caption)
                        .foregroundColor(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.regularMaterial)
                    .cornerRadius(16)

                    VStack(alignment: .leading, spacing: 12) {

                        Text("Meal & Mood")
                            .font(.headline)

                        Text("🍽️ Full Meals: \(childVM.children.filter { $0.meal == "Full" }.count)")
                            .font(.caption)

                        Text("😊 Happy Children: \(childVM.children.filter { $0.mood == "Happy" }.count)")
                            .font(.caption)

                        Text("⚠️ Incidents: \(incidentVM.totalIncidents)")
                            .font(.caption)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.regularMaterial)
                    .cornerRadius(16)
                }
                
                HStack {

                    Chart {

                        BarMark(
                            x: .value("Status", "Present"),
                            y: .value("Count", childVM.children.filter { $0.isPresent }.count)
                        )

                        BarMark(
                            x: .value("Status", "Absent"),
                            y: .value("Count", childVM.children.filter { !$0.isPresent }.count)
                        )
                    }
                    .frame(height: 120)

                    Chart {

                        BarMark(
                            x: .value("Type", "Pending"),
                            y: .value("Count", incidentVM.unresolvedIncidents)
                        )

                        BarMark(
                            x: .value(
                                "Type",
                                "Resolved"
                            ),
                            y: .value(
                                "Count",
                                incidentVM.totalIncidents - incidentVM.unresolvedIncidents
                            )
                        )
                    }
                    .frame(height: 120)
                }
                .padding()
                .background(.regularMaterial)
                .cornerRadius(16)
                    // Management Report Card
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("Management Reports")
                            .font(.headline)
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 5) {
                                
                                Text("Daily Nursery Report")
                                    .font(.subheadline)
                                    .bold()
                                
                                Text("Attendance and incident statistics")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Button {
                                
                                pdfURL = PDFGenerator.createReport(
                                    children: childVM.children.count,
                                    present: childVM.children.filter { $0.isPresent }.count,
                                    incidents: incidentVM.totalIncidents
                                )
                                
                            } label: {
                                
                                Image(systemName: "arrow.down.doc.fill")
                                    .font(.title2)
                            }
                        }
                        
                        if let pdfURL {
                            
                            ShareLink(
                                item: pdfURL,
                                preview: SharePreview("Nursery Report")
                            ) {
                                
                                HStack {
                                    
                                    Image(systemName: "square.and.arrow.up.fill")
                                    
                                    Text("Share Generated Report")
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [
                                .blue.opacity(0.15),
                                .green.opacity(0.15)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(16)
                }
                .padding()
            }
            .background(Color(.systemGray6))
            .navigationTitle("Dashboard")
        }
    }

