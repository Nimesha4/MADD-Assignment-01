//
//  AddIncidentView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-05-31.
//

import SwiftUI

struct AddIncidentView: View {

    @EnvironmentObject var incidentVM: IncidentViewModel
    @Environment(\.dismiss) var dismiss

    @State private var childName = ""
    @State private var title = ""
    @State private var details = ""

    var body: some View {

        Form {

            Section("Child Information") {

                TextField(
                    "Child Name",
                    text: $childName
                )
            }

            Section("Incident Information") {

                TextField(
                    "Incident Title",
                    text: $title
                )

                TextField(
                    "Description",
                    text: $details,
                    axis: .vertical
                )
            }

            Section {

                Button {

                    print("Before = \(incidentVM.incidents.count)")

                    incidentVM.addIncident(
                        childName: childName,
                        title: title,
                        details: details
                    )

                    print("After = \(incidentVM.incidents.count)")

                    dismiss()

                } label: {

                    Label(
                        "Save Incident",
                        systemImage: "checkmark.circle.fill"
                    )
                }
            }
        }
        .navigationTitle("New Incident")
    }
}
