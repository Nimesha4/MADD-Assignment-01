//
//  MonitoringHomeView.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import SwiftUI

struct MonitoringHomeView: View {
    @Bindable var model: MonitoringAppModel
    
    var body: some View {
        // TabView automatically renders as a premium vertical floating ornament on visionOS
        TabView {
            // Tab 1: Dashboard Overview
            dashboardTab
                .tabItem {
                    Label("Dashboard", systemImage: "square.grid.2x2.fill")
                }
            
            // Tab 2: Daily Activities Timeline
            activitiesTab
                .tabItem {
                    Label("Activities", systemImage: "calendar.badge.clock")
                }
            
            // Tab 3: Development Progress Swift Charts
            progressTab
                .tabItem {
                    Label("Progress", systemImage: "chart.bar.fill")
                }
            
            // Tab 4: Spatial 3D Space Controller
            spatialRoomTab
                .tabItem {
                    Label("3D Room", systemImage: "arkit")
                }
        }
    }
    
    // MARK: - Tab Views
    
    private var dashboardTab: some View {
        VStack(spacing: 20) {
            tabHeader(title: "Parent Dashboard", subtitle: "Overview of Olivia's Day")
            
            HStack(alignment: .top, spacing: 20) {
                VStack(spacing: 20) {
                    ChildProfileCard(
                        name: model.childName,
                        classroom: model.classroom,
                        age: model.age,
                        keyworker: model.keyworker,
                        wellbeingStatus: model.wellbeingStatus
                    )
                    
                    IncidentReportCard(
                        incidentStatus: model.incidentStatus,
                        minorNote: model.minorNote,
                        staffAction: model.staffAction,
                        parentVisibilityNote: model.parentVisibilityNote
                    )
                }
                
                VStack(spacing: 20) {
                    AttendanceCard(
                        todayStatus: model.attendanceStatus,
                        dropOffTime: model.dropOffTime,
                        pickUpPerson: model.pickUpPerson,
                        sessionType: model.nurserySession
                    )
                    
                    MealTrackingCard(
                        breakfast: model.breakfastStatus,
                        lunch: model.lunchStatus,
                        snack: model.snackStatus,
                        hydration: model.hydrationStatus,
                        allergyNote: model.allergyAlert
                    )
                }
            }
        }
        .padding(32)
    }
    
    private var activitiesTab: some View {
        VStack(spacing: 20) {
            tabHeader(title: "Nursery Activities", subtitle: "Olivia's Timetable & Timeline")
            
            HStack(spacing: 24) {
                DailyActivityCard(activities: model.activities)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Explanatory glass card
                VisionCard(title: "Activity Insights", icon: "info.circle.fill", headerColor: .blue) {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Today's curriculum focuses on creative expression and outdoor physical development.")
                            .font(.body)
                            .foregroundStyle(.secondary)
                        
                        Divider()
                            .background(Color.blue.opacity(0.3))
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Label("Morning Focus", systemImage: "sun.max.fill")
                                .font(.headline)
                                .foregroundStyle(.orange)
                            Text("Circle discussion and fine motor skills training through rainbow painting.")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Label("Afternoon Focus", systemImage: "moon.stars.fill")
                                .font(.headline)
                                .foregroundStyle(.purple)
                            Text("Sensory reading and quiet sleep cycles to ensure healthy growth cycles.")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                    }
                }
                .frame(width: 380)
            }
        }
        .padding(32)
    }
    
    private var progressTab: some View {
        VStack(spacing: 20) {
            tabHeader(title: "Milestone Assessment", subtitle: "Early Years Foundation Stage (EYFS) Tracking")
            
            HStack(spacing: 24) {
                DevelopmentProgressChart(progressData: model.progressData)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Detailed progress indicators
                VisionCard(title: "Assessed Categories", icon: "doc.text.magnifyingglass", headerColor: .pink) {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 12) {
                            ProgressRow(title: "Communication", score: 85, color: .pink)
                            ProgressRow(title: "Physical Development", score: 90, color: .pink)
                            ProgressRow(title: "Social & Emotional", score: 80, color: .pink)
                            ProgressRow(title: "Creative Expression", score: 95, color: .pink)
                            ProgressRow(title: "Independence Skills", score: 75, color: .pink)
                            
                            Spacer(minLength: 10)
                            
                            Text("Assessments are logged weekly by keyworker Emma based on standard UK nursery guidelines.")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .italic()
                        }
                    }
                }
                .frame(width: 380)
            }
        }
        .padding(32)
    }
    
    private var spatialRoomTab: some View {
        VStack(spacing: 20) {
            tabHeader(title: "3D Spatial Room", subtitle: "Mixed Reality Child Monitoring Space")
            
            HStack(spacing: 24) {
                // Left Column: Main launch controller
                MonitoringLaunchCard(model: model)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Right Column: Simulator Helper panel (Only visible when space is open)
                if model.isImmersiveSpaceActive {
                    VisionCard(title: "Simulator Quick Controls", icon: "gamecontroller.fill", headerColor: .orange) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("If looking around and clicking the floating 3D shapes is difficult with your mouse in the simulator, select the stations directly using these controls:")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .lineLimit(3)
                            
                            // Station Quick Buttons
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing: 8) {
                                    ForEach(model.stations) { station in
                                        Button(action: {
                                            model.selectedStationId = (model.selectedStationId == station.id) ? nil : station.id
                                        }) {
                                            HStack {
                                                Image(systemName: station.icon)
                                                    .foregroundStyle(station.color)
                                                Text(station.title)
                                                    .font(.caption)
                                                    .fontWeight(.semibold)
                                                Spacer()
                                                if model.selectedStationId == station.id {
                                                    Image(systemName: "checkmark.circle.fill")
                                                        .foregroundStyle(.green)
                                                }
                                            }
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 6)
                                        }
                                        .buttonStyle(.bordered)
                                        .tint(model.selectedStationId == station.id ? .green : .primary)
                                    }
                                    
                                    if model.selectedStationId != nil {
                                        Button("Deselect Station") {
                                            model.selectedStationId = nil
                                        }
                                        .buttonStyle(.plain)
                                        .foregroundStyle(.red)
                                        .font(.caption)
                                        .padding(.top, 6)
                                    }
                                }
                            }
                        }
                    }
                    .frame(width: 380)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                } else {
                    // Explanatory placeholder when room is closed
                    VisionCard(title: "Room Instructions", icon: "arrow.up.left.and.arrow.down.right", headerColor: .purple) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("How to explore the Immersive Space:")
                                .font(.headline)
                                .foregroundStyle(.purple)
                            
                            BulletItem(icon: "1.circle.fill", text: "Click the launch button on the left to enter.")
                            BulletItem(icon: "2.circle.fill", text: "Look around the simulator room using Option (⌥) + Drag mouse.")
                            BulletItem(icon: "3.circle.fill", text: "Gaze at any 3D floating shape and click to select.")
                            BulletItem(icon: "4.circle.fill", text: "Use the Simulator Quick Controls to trigger detail panels instantly.")
                            
                            Spacer()
                        }
                    }
                    .frame(width: 380)
                }
            }
            .animation(.spring(), value: model.isImmersiveSpaceActive)
        }
        .padding(32)
    }
    
    // MARK: - Reusable UI Subviews
    
    private func tabHeader(title: String, subtitle: String) -> some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(LinearGradient(
                        colors: [.purple, .orange],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .frame(width: 44, height: 44)
                Image(systemName: "sparkles")
                    .foregroundStyle(.white)
                    .font(.subheadline)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.title)
                    .fontWeight(.black)
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            // App branding
            HStack(spacing: 6) {
                Image(systemName: "hand.raised.fill")
                    .foregroundStyle(.purple)
                Text("NurseryConnect")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .glassBackgroundEffect()
        }
    }
}

// Helper view for Progress tab
struct ProgressRow: View {
    let title: String
    let score: Double
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(title)
                    .font(.caption)
                    .fontWeight(.medium)
                Spacer()
                Text("\(Int(score))%")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(color)
            }
            
            ProgressView(value: score, total: 100)
                .tint(color.opacity(0.8))
                .background(Color.white.opacity(0.1))
                .scaleEffect(x: 1, y: 1.5, anchor: .center)
                .clipShape(Capsule())
        }
    }
}

// Helper bullet item view
struct BulletItem: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: icon)
                .foregroundStyle(.purple)
                .font(.body)
            Text(text)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(2)
        }
    }
}

#Preview {
    @MainActor
    struct PreviewContainer: View {
        @State private var model = MonitoringAppModel()
        var body: some View {
            MonitoringHomeView(model: model)
        }
    }
    return PreviewContainer()
}
