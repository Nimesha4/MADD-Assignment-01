//
//  ChildProfileCard.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import SwiftUI

struct ChildProfileCard: View {
    let name: String
    let classroom: String
    let age: String
    let keyworker: String
    let wellbeingStatus: String
    
    var body: some View {
        VisionCard(title: "Child Profile", icon: "person.crop.circle.fill", headerColor: .purple) {
            HStack(spacing: 16) {
                // Friendly Avatar
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.purple.opacity(0.6), .orange.opacity(0.5)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 70, height: 70)
                    
                    Text(String(name.prefix(1)))
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    
                    Text(classroom)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
            }
            .padding(.bottom, 6)
            
            // Detail Fields
            VStack(spacing: 8) {
                HStack {
                    Text("Age:")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(age)
                        .fontWeight(.medium)
                }
                
                HStack {
                    Text("Keyworker:")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(keyworker)
                        .fontWeight(.medium)
                }
                
                Divider()
                    .background(Color.white.opacity(0.15))
                    .padding(.vertical, 4)
                
                // Wellbeing Status Row
                VStack(alignment: .leading, spacing: 4) {
                    Text("Wellbeing Status:")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    HStack(spacing: 6) {
                        Image(systemName: "face.smiling.fill")
                            .foregroundStyle(.green)
                        
                        Text(wellbeingStatus)
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundStyle(.green)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color.green.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .font(.body)
        }
    }
}

#Preview {
    ChildProfileCard(
        name: "Olivia",
        classroom: "Sunshine Room",
        age: "3 years",
        keyworker: "Emma",
        wellbeingStatus: "Happy and settled"
    )
    .frame(width: 320)
    .padding()
}
