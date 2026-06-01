//
//  Incident.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-05-31.
//

import Foundation

struct Incident: Identifiable, Codable {
    var id = UUID()
    var childName: String
    var title: String
    var details: String
    var date = Date()
    var resolved = false
}
