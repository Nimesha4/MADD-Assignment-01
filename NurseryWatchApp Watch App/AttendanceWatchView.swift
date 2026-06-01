//
//  AttendanceWatchView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-06-01.
//

import SwiftUI

struct AttendanceWatchView: View {

    let children = [
        ("Emma", true),
        ("John", true),
        ("Sophia", false)
    ]

    var body: some View {

        ScrollView {

            VStack(spacing: 12) {

                VStack(spacing: 5) {

                    Text("Present")
                        .font(.caption)

                    Text("2")
                        .font(.title2)
                        .bold()

                    Text("Absent: 1")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.15))
                .cornerRadius(12)

                ForEach(children, id: \.0) { child in

                    HStack {

                        Image(
                            systemName: child.1
                            ? "checkmark.circle.fill"
                            : "xmark.circle.fill"
                        )
                        .foregroundColor(
                            child.1 ? .green : .red
                        )

                        Text(child.0)

                        Spacer()
                    }
                    .padding()
                    .background(.gray.opacity(0.15))
                    .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationTitle("Attendance")
    }
}
