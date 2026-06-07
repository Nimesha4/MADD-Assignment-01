//
//  MonitoringAppModel.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import Foundation
import SwiftUI
import Observation

@Observable
@MainActor
class MonitoringAppModel {
    // Spatial monitoring space state
    var isImmersiveSpaceActive: Bool = false
    var selectedStationId: String? = nil
    
    // Child Profile Details
    var childName: String = "Olivia"
    var classroom: String = "Sunshine Room"
    var age: String = "3 years"
    var keyworker: String = "Emma"
    var wellbeingStatus: String = "Happy and settled"
    
    // Attendance Details
    var attendanceStatus: String = "Present"
    var dropOffTime: String = "8:25 AM"
    var pickUpPerson: String = "Mother"
    var nurserySession: String = "Full Day"
    
    // Meal details
    var breakfastStatus: String = "Completed"
    var lunchStatus: String = "Ate most of meal"
    var snackStatus: String = "Completed"
    var hydrationStatus: String = "Good"
    var allergyAlert: String = "No allergy alert today"
    
    // Incident reports
    var incidentStatus: String = "No serious incident"
    var minorNote: String = "Small bump during outdoor play"
    var staffAction: String = "Checked and monitored"
    var parentVisibilityNote: String = "Report available for review"
    
    // Daily activities list
    var activities: [String] = [
        "Morning circle",
        "Outdoor play",
        "Story time",
        "Creative painting",
        "Nap time"
    ]
    
    // Development progress data
    var progressData: [DevelopmentProgress] = [
        DevelopmentProgress(area: "Communication", score: 85),
        DevelopmentProgress(area: "Physical", score: 90),
        DevelopmentProgress(area: "Social", score: 80),
        DevelopmentProgress(area: "Creative", score: 95),
        DevelopmentProgress(area: "Independence", score: 75)
    ]
    
    // Static definition of 3D Spatial Stations
    var stations: [MonitoringStation] = []
    
    init() {
        self.stations = [
            MonitoringStation(
                id: "attendance",
                title: "Attendance Station",
                icon: "checkmark.circle.fill",
                summary: "Today: Present",
                status: "Checked In",
                statusColor: .green,
                positionX: -1.2,
                positionY: 1.2,
                positionZ: -1.5,
                shapeType: .cylinder,
                color: Color(red: 0.6, green: 0.8, blue: 0.6), // Calm soft green
                detailText: "Olivia was dropped off at 8:25 AM by her mother. She is registered for a Full Day session.",
                parentValue: "Verified Drop-off",
                staffNote: "Welcomed by Emma. Olivia waved goodbye happily.",
                safetyNote: "Attendance registered on main nursery system instantly."
            ),
            MonitoringStation(
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
                color: Color(red: 0.8, green: 0.6, blue: 0.9), // Soft lavender
                detailText: "Olivia ate all of her morning snack and most of her lunch (vegetable pasta). She had two cups of water.",
                parentValue: "Healthy Nutrition Intake",
                staffNote: "Olivia enjoyed her food and requested to wash her own hands after eating.",
                safetyNote: "Staff cross-checked allergy checklist: No allergies recorded."
            ),
            MonitoringStation(
                id: "incident",
                title: "Incident Station",
                icon: "exclamationmark.triangle.fill",
                summary: "Minor: Outdoor play bump",
                status: "Monitored / Safe",
                statusColor: .orange,
                positionX: 0.0,
                positionY: 1.45,
                positionZ: -1.8,
                shapeType: .box,
                color: Color(red: 0.95, green: 0.7, blue: 0.6), // Soft peach/orange
                detailText: "Olivia had a minor slip during outdoor playground play, resulting in a tiny bump on her knee.",
                parentValue: "Minor Active Check",
                staffNote: "Emma cleaned the knee and applied a cool compress. Olivia was comforted and back to playing in minutes.",
                safetyNote: "Checked and monitored. No medical team attention required. Parent notified."
            ),
            MonitoringStation(
                id: "activity",
                title: "Activity Station",
                icon: "star.fill",
                summary: "Now: Story Time / Creative",
                status: "Very Engaged",
                statusColor: .blue,
                positionX: 0.6,
                positionY: 1.35,
                positionZ: -1.7,
                shapeType: .torus,
                color: Color(red: 0.6, green: 0.75, blue: 0.95), // Calm soft blue
                detailText: "Olivia participated actively in morning circle, painted a rainbow, and enjoyed outdoor playtime.",
                parentValue: "Social & Creative Exploration",
                staffNote: "Particularly focused during story time, pointing at pictures of animals.",
                safetyNote: "Activities follow nursery curriculum framework guidelines."
            ),
            MonitoringStation(
                id: "progress",
                title: "Progress Station",
                icon: "chart.bar.xaxis",
                summary: "Creative & Physical Highs",
                status: "Developing Well",
                statusColor: .pink,
                positionX: 1.2,
                positionY: 1.2,
                positionZ: -1.5,
                shapeType: .cone,
                color: Color(red: 0.95, green: 0.6, blue: 0.75), // Soft pastel pink
                detailText: "Olivia is showing excellent development progress this week, especially in social bonding and drawing skills.",
                parentValue: "Personal Milestone Tracking",
                staffNote: "Independence is growing; she is dressing herself in her coat.",
                safetyNote: "Assessed based on Early Years Foundation Stage (EYFS) standards."
            )
        ]
    }
    
    // Selects next or prev station for easier presentation
    func selectStation(id: String) {
        if selectedStationId == id {
            selectedStationId = nil // Toggle/close
        } else {
            selectedStationId = id
        }
    }
}

/// Helper struct for Swift Charts data
struct DevelopmentProgress: Identifiable, Hashable {
    let id = UUID()
    let area: String
    let score: Double
}
