//
//  AttendanceVisionView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-06-01.
//

import SwiftUI

struct AttendanceVisionView: View {

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 25) {

                VStack(alignment: .leading, spacing: 8) {

                    Text("Attendance Overview")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Today's child attendance status")
                        .foregroundStyle(.secondary)
                }

                HStack(spacing: 20) {

                    AttendanceSummaryCard(
                        title: "Present",
                        value: "18",
                        icon: "checkmark.circle.fill"
                    )

                    AttendanceSummaryCard(
                        title: "Absent",
                        value: "2",
                        icon: "xmark.circle.fill"
                    )
                }

                VStack(spacing: 15) {

                    AttendanceRow(
                        name: "Emma",
                        status: "Present",
                        icon: "checkmark.circle.fill",
                        isPresent: true
                    )

                    AttendanceRow(
                        name: "John",
                        status: "Present",
                        icon: "checkmark.circle.fill",
                        isPresent: true
                    )

                    AttendanceRow(
                        name: "Noah",
                        status: "Present",
                        icon: "checkmark.circle.fill",
                        isPresent: true
                    )

                    AttendanceRow(
                        name: "Sophia",
                        status: "Absent",
                        icon: "xmark.circle.fill",
                        isPresent: false
                    )
                }
            }
            .padding(30)
        }
        .navigationTitle("Attendance")
    }
}

struct AttendanceSummaryCard: View {

    let title: String
    let value: String
    let icon: String

    var body: some View {

        VStack(spacing: 10) {

            Image(systemName: icon)
                .font(.system(size: 30))
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

struct AttendanceRow: View {

    let name: String
    let status: String
    let icon: String
    let isPresent: Bool

    var body: some View {

        HStack {

            Label(name, systemImage: "person.fill")

            Spacer()

            Label(status, systemImage: icon)
                .foregroundStyle(isPresent ? .green : .red)
        }
        .padding()
        .glassBackgroundEffect()
    }
}

#Preview {
    NavigationStack {
        AttendanceVisionView()
    }
}
