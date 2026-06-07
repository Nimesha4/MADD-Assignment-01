//
//  RealityMonitoringObjects.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import RealityKit
import SwiftUI
import UIKit

struct RealityMonitoringObjects {
    
    /// Generates a programmatically built 3D Entity for a given station.
    /// Includes collision shapes, hover effects, and input targets for visionOS spatial tap.
    @MainActor
    static func createStationEntity(for station: MonitoringStation) -> Entity {
        let rootEntity = Entity()
        rootEntity.name = station.id
        
        // Define glassy translucent PBR material matching childcare pastel colors
        var material = PhysicallyBasedMaterial()
        material.baseColor = .init(tint: UIColor(station.color))
        material.roughness = .init(floatLiteral: 0.1)
        material.metallic = .init(floatLiteral: 0.2)
        material.clearcoat = .init(floatLiteral: 1.0) // Glass-like outer shell
        material.clearcoatRoughness = .init(floatLiteral: 0.05)
        material.blending = .transparent(opacity: .init(floatLiteral: 0.75)) // Semi-translucent
        
        var modelEntity: ModelEntity
        
        switch station.shapeType {
        case .cylinder:
            // Attendance: Simple cylindrical beacon
            let mesh = MeshResource.generateCylinder(height: 0.28, radius: 0.12)
            modelEntity = ModelEntity(mesh: mesh, materials: [material])
            
            // Set collision shape matching cylinder using a bounding box shape
            let collisionShape = ShapeResource.generateBox(width: 0.24, height: 0.28, depth: 0.24)
            modelEntity.components.set(CollisionComponent(shapes: [collisionShape]))
            
        case .sphere:
            // Meal: Perfect round meal bubble
            let mesh = MeshResource.generateSphere(radius: 0.14)
            modelEntity = ModelEntity(mesh: mesh, materials: [material])
            
            let collisionShape = ShapeResource.generateSphere(radius: 0.14)
            modelEntity.components.set(CollisionComponent(shapes: [collisionShape]))
            
        case .box:
            // Incident: Soft first aid cube
            let mesh = MeshResource.generateBox(width: 0.22, height: 0.22, depth: 0.22, cornerRadius: 0.04)
            modelEntity = ModelEntity(mesh: mesh, materials: [material])
            
            let collisionShape = ShapeResource.generateBox(width: 0.22, height: 0.22, depth: 0.22)
            modelEntity.components.set(CollisionComponent(shapes: [collisionShape]))
            
        case .torus:
            // Activity: Saturn-like active spinning top (Sphere + flat cylinder ring)
            let coreMesh = MeshResource.generateSphere(radius: 0.11)
            let core = ModelEntity(mesh: coreMesh, materials: [material])
            
            // Ring material - slightly more reflective
            var ringMaterial = material
            ringMaterial.blending = .transparent(opacity: .init(floatLiteral: 0.5))
            
            let ringMesh = MeshResource.generateCylinder(height: 0.02, radius: 0.2)
            let ring = ModelEntity(mesh: ringMesh, materials: [ringMaterial])
            
            // Assemble Saturn object
            core.addChild(ring)
            modelEntity = core
            
            // Collision encapsulates the entire shape
            let collisionShape = ShapeResource.generateSphere(radius: 0.2)
            modelEntity.components.set(CollisionComponent(shapes: [collisionShape]))
            
        case .cone:
            // Progress: Progress beacon tower (Cylinder base + sphere beacon top)
            let baseMesh = MeshResource.generateCylinder(height: 0.2, radius: 0.1)
            let base = ModelEntity(mesh: baseMesh, materials: [material])
            
            // Spherical beacon top
            var beaconMaterial = material
            beaconMaterial.emissiveColor = .init(color: UIColor(station.color).withAlphaComponent(0.4))
            
            let topMesh = MeshResource.generateSphere(radius: 0.08)
            let top = ModelEntity(mesh: topMesh, materials: [beaconMaterial])
            top.position = [0, 0.14, 0] // stack on top of base
            
            base.addChild(top)
            modelEntity = base
            
            // Collision box that fits the stack
            let collisionShape = ShapeResource.generateBox(width: 0.2, height: 0.36, depth: 0.2)
            modelEntity.components.set(CollisionComponent(shapes: [collisionShape]))
        }
        
        // Setup spatial input targeting so the user can look and tap
        modelEntity.components.set(InputTargetComponent())
        
        // Add native visionOS gaze-highlight hover effect
        modelEntity.components.set(HoverEffectComponent())
        
        rootEntity.addChild(modelEntity)
        
        // Position the station in space
        rootEntity.position = [station.positionX, station.positionY, station.positionZ]
        
        return rootEntity
    }
}
