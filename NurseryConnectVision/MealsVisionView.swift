//
//  MealsVisionView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-06-01.
//

import SwiftUI

struct MealsVisionView: View {

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 25) {

                VStack(alignment: .leading, spacing: 8) {

                    Text("Meals Overview")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Daily meal service status")
                        .foregroundStyle(.secondary)
                }

                HStack(spacing: 20) {

                    MealSummaryCard(
                        title: "Meals Served",
                        value: "95%",
                        icon: "fork.knife"
                    )

                    MealSummaryCard(
                        title: "Children Fed",
                        value: "18",
                        icon: "person.3.fill"
                    )
                }

                VStack(spacing: 15) {

                    MealRow(
                        meal: "Breakfast",
                        status: "Completed",
                        icon: "sunrise.fill"
                    )

                    MealRow(
                        meal: "Lunch",
                        status: "Completed",
                        icon: "sun.max.fill"
                    )

                    MealRow(
                        meal: "Snack Time",
                        status: "Completed",
                        icon: "cup.and.saucer.fill"
                    )
                }

                GlassMealInfoCard(
                    title: "Today's Nutrition Summary",
                    lines: [
                        "Breakfast Served Successfully, Lunch Completed and Snack Distribution Completed",
                        "95% Meal Completion Rate"
                    ]
                )
            }
            .padding(30)
        }
        .navigationTitle("Meals")
    }
}

struct MealSummaryCard: View {

    let title: String
    let value: String
    let icon: String

    var body: some View {

        VStack(spacing: 12) {

            Image(systemName: icon)
                .font(.system(size: 32))
                .foregroundStyle(.orange)

            Text(value)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(title)
                .font(.headline)
        }
        .frame(width: 220, height: 140)
        .glassBackgroundEffect()
    }
}

struct MealRow: View {

    let meal: String
    let status: String
    let icon: String

    var body: some View {

        HStack {

            Label(meal, systemImage: icon)

            Spacer()

            Label(
                status,
                systemImage: "checkmark.circle.fill"
            )
            .foregroundStyle(.green)
        }
        .padding()
        .glassBackgroundEffect()
    }
}

struct GlassMealInfoCard: View {

    let title: String
    let lines: [String]

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text(title)
                .font(.headline)

            ForEach(lines, id: \.self) { line in

                Label(
                    line,
                    systemImage: "leaf.fill"
                )
                .font(.caption)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .glassBackgroundEffect()
    }
}

#Preview {
    NavigationStack {
        MealsVisionView()
    }
}
