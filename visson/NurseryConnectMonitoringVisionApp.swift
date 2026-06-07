//
//  NurseryConnectMonitoringVisionApp.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import SwiftUI

@main
struct NurseryConnectMonitoringVisionApp: App {
    // Shared state model managing dashboard data and immersive space coordination
    @State private var model = MonitoringAppModel()
    
    var body: some Scene {
        // Main 2D glassmorphic control dashboard
        WindowGroup {
            MonitoringHomeView(model: model)
        }
        .defaultSize(width: 1120, height: 780)
        
        // 3D Spatial Environment where nursery categories become interactable objects
        ImmersiveSpace(id: "ChildMonitoringSpace") {
            ChildMonitoringSpaceView(model: model)
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
    }
}
