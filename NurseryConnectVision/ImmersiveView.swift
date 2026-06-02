//
//  ImmersiveView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-06-01.
//

import SwiftUI
import RealityKit

struct ImmersiveView: View {

    var body: some View {

        RealityView { content in

            let floor = ModelEntity(
                mesh: .generateBox(width: 2.0,
                                   height: 0.05,
                                   depth: 2.0),
                materials: [
                    SimpleMaterial(
                        color: .brown,
                        isMetallic: false
                    )
                ]
            )

            floor.position = [0, 0, -2]

            let classroomA = ModelEntity(
                mesh: .generateBox(width: 0.4,
                                   height: 0.3,
                                   depth: 0.4),
                materials: [
                    SimpleMaterial(
                        color: .green,
                        isMetallic: false
                    )
                ]
            )

            classroomA.position = [-0.7, 0.2, -2]

            let classroomB = ModelEntity(
                mesh: .generateBox(width: 0.4,
                                   height: 0.3,
                                   depth: 0.4),
                materials: [
                    SimpleMaterial(
                        color: .blue,
                        isMetallic: false
                    )
                ]
            )

            classroomB.position = [0.7, 0.2, -2]

            let playArea = ModelEntity(
                mesh: .generateSphere(radius: 0.18),
                materials: [
                    SimpleMaterial(
                        color: .orange,
                        isMetallic: false
                    )
                ]
            )

            playArea.position = [0, 0.2, -2]

            content.add(floor)
            content.add(classroomA)
            content.add(classroomB)
            content.add(playArea)
        }
    }
}
