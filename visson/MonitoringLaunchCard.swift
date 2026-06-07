//
//  MonitoringLaunchCard.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import SwiftUI

struct MonitoringLaunchCard: View {
    @Bindable var model: MonitoringAppModel
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    @State private var isLoading = false
    
    var body: some View {
        VisionCard(title: "Nursery 3D Spatial Room", icon: "cube.transparent.fill", headerColor: .purple) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Enter an immersive 3D monitoring space to view Olivia's nursery day represented by interactive spatial stations.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
                
                Spacer(minLength: 0)
                
                if model.isImmersiveSpaceActive {
                    // Exit Button
                    Button(action: toggleSpace) {
                        HStack {
                            if isLoading {
                                ProgressView()
                                    .padding(.trailing, 8)
                            } else {
                                Image(systemName: "xmark.circle.fill")
                            }
                            Text("Exit Immersive Space")
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red.opacity(0.8))
                    .disabled(isLoading)
                } else {
                    // Enter Button
                    Button(action: toggleSpace) {
                        HStack {
                            if isLoading {
                                ProgressView()
                                    .padding(.trailing, 8)
                            } else {
                                Image(systemName: "arkit")
                            }
                            Text("Enter Monitoring Space")
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(LinearGradient(
                        colors: [.purple, .orange],
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .disabled(isLoading)
                }
            }
        }
    }
    
    private func toggleSpace() {
        isLoading = true
        Task {
            if model.isImmersiveSpaceActive {
                await dismissImmersiveSpace()
                model.isImmersiveSpaceActive = false
            } else {
                let result = await openImmersiveSpace(id: "ChildMonitoringSpace")
                switch result {
                case .opened:
                    model.isImmersiveSpaceActive = true
                case .error, .userCancelled:
                    print("Error opening immersive space or cancelled by user.")
                @unknown default:
                    break
                }
            }
            isLoading = false
        }
    }
}
