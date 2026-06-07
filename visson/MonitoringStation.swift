//
//  MonitoringStation.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import Foundation
import SwiftUI

/// Defines the RealityKit shape types we can generate programmatically.
enum RealityShapeType: String, Codable {
    case sphere
    case box
    case cylinder
    case torus
    case cone
}

/// Represents a childcare spatial monitoring station inside the immersive 3D space.
struct MonitoringStation: Identifiable, Hashable {
    let id: String
    let title: String
    let icon: String
    let summary: String
    let status: String
    let statusColor: Color
    
    // 3D positioning coordinates in meters relative to the user
    let positionX: Float
    let positionY: Float
    let positionZ: Float
    
    // RealityKit 3D object properties
    let shapeType: RealityShapeType
    let color: Color
    
    // Detailed data for selection panel
    let detailText: String
    let parentValue: String
    let staffNote: String
    let safetyNote: String
}
