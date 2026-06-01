//
//  StatisticsWatchView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-06-01.
//

import SwiftUI

struct StatisticsWatchView: View {

    var body: some View {

        ScrollView {

            VStack(spacing: 15) {

                VStack(spacing: 8) {

                    Text("Attendance")
                        .font(.headline)

                    Gauge(value: 0.8) { }
                        .tint(.green)

                    Text("80%")
                        .font(.title3)
                        .bold()

                    Text("8 of 10 Present")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(.gray.opacity(0.15))
                .cornerRadius(12)

                VStack(spacing: 8) {

                    Text("Incidents")
                        .font(.headline)

                    Gauge(value: 0.67) { }
                        .tint(.orange)

                    Text("67%")
                        .font(.title3)
                        .bold()

                    Text("2 of 3 Resolved")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(.gray.opacity(0.15))
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("Statistics")
    }
}
