//
//  ChildMonitoringSpaceView.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import SwiftUI
import RealityKit

struct ChildMonitoringSpaceView: View {
    @Bindable var model: MonitoringAppModel
    
    private var tapGesture: some Gesture {
        TapGesture()
            .targetedToAnyEntity()
            .onEnded { value in
                var currentEntity: Entity? = value.entity
                while let entity = currentEntity {
                    if model.stations.contains(where: { $0.id == entity.name }) {
                        model.selectedStationId = entity.name
                        break
                    }
                    currentEntity = entity.parent
                }
            }
    }
    
    @MainActor
    private func setupRealityContent(content: inout RealityViewContent, attachments: RealityViewAttachments) {
        // 1. Create and position the 5 spatial stations
        for station in model.stations {
            let stationEntity = RealityMonitoringObjects.createStationEntity(for: station)
            
            // Retrieve the matching floating label attachment
            if let labelAttachment = attachments.entity(for: station.id) {
                labelAttachment.position = [0, 0.24, 0]
                stationEntity.addChild(labelAttachment)
            }
            
            content.add(stationEntity)
        }
        
        // 2. Add the central detailed panel HUD
        if let detailPanelAttachment = attachments.entity(for: "detailPanel") {
            detailPanelAttachment.position = [0.0, 1.05, -1.1]
            content.add(detailPanelAttachment)
        }
    }
    
    var body: some View {
        RealityView { content, attachments in
            setupRealityContent(content: &content, attachments: attachments)
        } attachments: {
            ForEach(model.stations) { station in
                Attachment(id: station.id) {
                    MonitoringStationPanel(
                        station: station,
                        isSelected: model.selectedStationId == station.id,
                        onTap: {
                            model.selectedStationId = (model.selectedStationId == station.id) ? nil : station.id
                        }
                    )
                }
            }
            
            Attachment(id: "detailPanel") {
                if let selectedId = model.selectedStationId,
                   let station = model.stations.first(where: { $0.id == selectedId }) {
                    MonitoringDetailPanel(
                        station: station,
                        onClose: {
                            model.selectedStationId = nil
                        }
                    )
                    .transition(.scale.combined(with: .opacity))
                    .animation(.spring(), value: model.selectedStationId)
                }
            }
        }
        .gesture(tapGesture)
    }
}

#Preview {
    @MainActor
    struct PreviewContainer: View {
        @State private var model = MonitoringAppModel()
        var body: some View {
            ChildMonitoringSpaceView(model: model)
        }
    }
    return PreviewContainer()
}
