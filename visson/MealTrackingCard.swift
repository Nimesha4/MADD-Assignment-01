//
//  MealTrackingCard.swift
//  vision
//
//  Created by Nimesha Jayawickrama on 2026-06-03.
//

import SwiftUI

struct MealTrackingCard: View {
    let breakfast: String
    let lunch: String
    let snack: String
    let hydration: String
    let allergyNote: String
    
    var body: some View {
        VisionCard(title: "Meal Tracking", icon: "fork.knife", headerColor: .purple) {
            VStack(alignment: .leading, spacing: 10) {
                // Individual meals
                VStack(spacing: 8) {
                    MealRow(mealName: "Breakfast", status: breakfast, icon: "cup.and.saucer.fill", activeColor: .orange)
                    MealRow(mealName: "Lunch", status: lunch, icon: "fork.knife", activeColor: .purple)
                    MealRow(mealName: "Snack", status: snack, icon: "apple.butt.fill", activeColor: .pink)
                    MealRow(mealName: "Hydration", status: hydration, icon: "drop.fill", activeColor: .blue)
                }
                
                Spacer(minLength: 0)
                
                // Allergy note banner
                HStack(spacing: 8) {
                    Image(systemName: "exclamationmark.shield.fill")
                        .foregroundStyle(.green)
                        .font(.body)
                    
                    Text(allergyNote)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Color.green.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.top, 4)
            }
        }
    }
}

struct MealRow: View {
    let mealName: String
    let status: String
    let icon: String
    let activeColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(activeColor.opacity(0.15))
                    .frame(width: 32, height: 32)
                
                Image(systemName: icon)
                    .foregroundStyle(activeColor)
                    .font(.footnote)
            }
            
            Text(mealName)
                .fontWeight(.medium)
                .foregroundStyle(.primary)
            
            Spacer()
            
            Text(status)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    MealTrackingCard(
        breakfast: "Completed",
        lunch: "Ate most of meal",
        snack: "Completed",
        hydration: "Good",
        allergyNote: "No allergy alert today"
    )
    .frame(width: 320, height: 260)
    .padding()
}
