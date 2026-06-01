//
//  ContentView.swift
//  NurseryWatchApp Watch App
//
//  Created by Nimesha Jayawickrama on 2026-06-01.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(spacing: 10) {

                    Text("👶 NurseryConnect")
                        .font(.headline)

                    VStack {
                        Text("Present Today")
                        Text("2 / 3")
                            .font(.title2)
                            .bold()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.15))
                    .cornerRadius(12)

                    VStack {
                        Text("Pending Incidents")
                        Text("1")
                            .font(.title2)
                            .bold()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.15))
                    .cornerRadius(12)

                    VStack {
                        Text("Attendance Rate")
                        Text("67%")
                            .font(.title3)
                            .bold()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.15))
                    .cornerRadius(12)

                    NavigationLink("View Attendance") {
                        AttendanceWatchView()
                    }

                    NavigationLink("View Incidents") {
                        IncidentWatchView()
                    }

                    NavigationLink("View Statistics") {
                        StatisticsWatchView()
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
