//
//  ChildrenVisionView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-06-01.
//

import SwiftUI

struct ChildrenVisionView: View {

    let children = [
        "Emma",
        "John",
        "Noah",
        "Sophia",
        "Olivia",
        "Liam",
        "James",
        "Ava"
    ]

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 25) {

                VStack(alignment: .leading, spacing: 8) {

                    Text("Present Children")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Children currently checked into the nursery")
                        .foregroundStyle(.secondary)
                }

                HStack(spacing: 20) {

                    ChildSummaryCard(
                        title: "Present",
                        value: "8",
                        icon: "person.3.fill"
                    )

                    ChildSummaryCard(
                        title: "Classrooms",
                        value: "3",
                        icon: "building.2.fill"
                    )
                }

                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 220))
                    ],
                    spacing: 20
                ) {

                    ForEach(children, id: \.self) { child in

                        ChildCard(name: child)
                    }
                }
            }
            .padding(30)
        }
        .navigationTitle("Children")
    }
}

struct ChildSummaryCard: View {

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

struct ChildCard: View {

    let name: String

    var body: some View {

        VStack(spacing: 12) {

            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 45))
                .foregroundStyle(.blue)

            Text(name)
                .font(.headline)

            Label(
                "Checked In",
                systemImage: "checkmark.circle.fill"
            )
            .foregroundStyle(.green)
            .font(.caption)
        }
        .frame(width: 220, height: 150)
        .glassBackgroundEffect()
    }
}

#Preview {
    NavigationStack {
        ChildrenVisionView()
    }
}
