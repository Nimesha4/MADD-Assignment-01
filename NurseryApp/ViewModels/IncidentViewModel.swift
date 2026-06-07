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
            details: "Child slipped during outdoor play area and received first aid.",
            resolved: true
        ),

        Incident(
            childName: "Sophia",
            title: "Allergy Alert",
            details: "Mild skin irritation observed after snack time. Parents notified.",
            resolved: false
        ),

        Incident(
            childName: "James",
            title: "Fever Observation",
            details: "Temperature slightly above normal. Child monitored and parents informed.",
            resolved: true
        ),

        Incident(
            childName: "Olivia",
            title: "Toy Dispute",
            details: "Conflict during indoor play session. Resolved through staff intervention.",
            resolved: true
        ),

        Incident(
            childName: "Lucas",
            title: "Outdoor Play Injury",
            details: "Minor scratch on arm while playing in activity zone.",
            resolved: false
        ),

        Incident(
            childName: "Ava",
            title: "Missed Meal",
            details: "Child refused lunch. Parents informed through diary update.",
            resolved: true
        ),

        Incident(
            childName: "Noah",
            title: "Lost Water Bottle",
            details: "Personal item misplaced during outdoor activities.",
            resolved: true
        ),

        Incident(
            childName: "Mia",
            title: "Nap Time Discomfort",
            details: "Child complained of headache before nap session.",
            resolved: true
        ),

        Incident(
            childName: "Benjamin",
            title: "Late Pickup",
            details: "Parent arrived 20 minutes after scheduled pickup time.",
            resolved: true
        ),

        Incident(
            childName: "Charlotte",
            title: "Minor Collision",
            details: "Accidental bump with another child during running activity.",
            resolved: true
        ),

        Incident(
            childName: "Ethan",
            title: "Cough Symptoms",
            details: "Persistent cough observed during morning activities.",
            resolved: false
        ),

        Incident(
            childName: "Amelia",
            title: "Food Allergy Concern",
            details: "Staff identified possible reaction and followed allergy protocol.",
            resolved: true
        ),

        Incident(
            childName: "Daniel",
            title: "Outdoor Equipment Issue",
            details: "Child reported discomfort while using climbing equipment.",
            resolved: true
        ),

        Incident(
            childName: "Grace",
            title: "Emotional Distress",
            details: "Child became upset during parent drop-off and required support.",
            resolved: true
        ),

        Incident(
            childName: "William",
            title: "Minor Nosebleed",
            details: "Short nosebleed occurred during classroom activity.",
            resolved: true
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
