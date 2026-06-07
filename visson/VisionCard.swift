//
//  VisionCard.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import SwiftUI

struct VisionCard<Content: View>: View {
    let title: String
    let icon: String
    let headerColor: Color
    let content: Content
    
    init(title: String, icon: String, headerColor: Color = .purple, @ViewBuilder content: () -> Content) {
        self.title = title
        self.icon = icon
        self.headerColor = headerColor
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            // Card Header
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundStyle(headerColor)
                
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                
                Spacer()
            }
            
            Divider()
                .background(headerColor.opacity(0.3))
            
            // Content
            content
        }
        .padding(20)
        .frame(minWidth: 260, maxWidth: .infinity, minHeight: 180, maxHeight: .infinity)
        // visionOS Apple-style glassmorphic material background
        .glassBackgroundEffect()
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        // Subtle child-theme gradient border for spatial depth
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(
                    LinearGradient(
                        colors: [
                            .purple.opacity(0.4),
                            .orange.opacity(0.3),
                            .clear,
                            .purple.opacity(0.1)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1.5
                )
        )
        // Standard interactive highlight in visionOS when looked at
        .hoverEffect()
    }
}

#Preview {
    VisionCard(title: "Sample Card", icon: "star.fill", headerColor: .orange) {
        Text("This is a preview of the custom glassmorphic NurseryConnect card.")
            .font(.body)
    }
    .padding()
}
