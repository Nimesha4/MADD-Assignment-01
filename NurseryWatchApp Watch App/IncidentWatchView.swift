//
//  IncidentWatchView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-06-01.
//

import SwiftUI

struct IncidentWatchView: View {

    var body: some View {

        ScrollView {

            VStack(spacing: 12) {

                HStack {

                    VStack {

                        Text("Pending")
                            .font(.caption)

                        Text("1")
                            .font(.title3)
                            .bold()
                    }

                    Spacer()

                    VStack {

                        Text("Resolved")
                            .font(.caption)

                        Text("2")
                            .font(.title3)
                            .bold()
                    }
                }
                .padding()
                .background(.gray.opacity(0.15))
                .cornerRadius(12)

                VStack(alignment: .leading, spacing: 6) {

                    Label(
                        "Minor Fall",
                        systemImage: "exclamationmark.triangle.fill"
                    )

                    Text("Emma")
                        .font(.caption)

                    Text("Pending")
                        .font(.caption2)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(.orange.opacity(0.2))
                        .cornerRadius(6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.gray.opacity(0.15))
                .cornerRadius(12)

                VStack(alignment: .leading, spacing: 6) {

                    Label(
                        "Fever",
                        systemImage: "checkmark.seal.fill"
                    )

                    Text("John")
                        .font(.caption)

                    Text("Resolved")
                        .font(.caption2)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(.green.opacity(0.2))
                        .cornerRadius(6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.gray.opacity(0.15))
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("Incidents")
    }
}
