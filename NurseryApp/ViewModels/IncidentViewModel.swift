//
//  IncidentViewModel.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-05-31.
//

import Foundation
import Combine

final class IncidentViewModel: ObservableObject {
    

    @Published var incidents: [Incident] = [

        Incident(
            childName: "Emma",
            title: "Minor Fall",
            details: "Child slipped during outdoor play.",
            resolved: false
        ),

        Incident(
            childName: "John",
            title: "Fever",
            details: "Temperature observed during afternoon session.",
            resolved: true
        ),

        Incident(
            childName: "Sophia",
            title: "Allergy",
            details: "Reported mild allergic reaction.",
            resolved: false
        )
    ]

    var totalIncidents: Int {
        incidents.count
    }

    var unresolvedIncidents: Int {
        incidents.filter { !$0.resolved }.count
    }


    func addIncident(
        childName: String,
        title: String,
        details: String
    ) {

        print("Adding Incident")

        let incident = Incident(
            childName: childName,
            title: title,
            details: details
        )

        incidents.append(incident)

        print("Total incidents = \(incidents.count)")
    }

    func resolveIncident(_ incident: Incident) {

        print("Resolve button tapped")

        guard let index = incidents.firstIndex(where: { $0.id == incident.id }) else {

            print("Incident not found")
            return
        }

        incidents[index].resolved = true

        print("Resolved")
    }
}
