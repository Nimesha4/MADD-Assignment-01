//
//  Child.swift
//  NurseryConnectApp
//
//  Created by Nimesha Jayawickrama on 2026-03-30.
//

import Foundation

struct Child: Identifiable {
    var id = UUID()
    var name: String
    var napTime: String
    var meal: String
    var mood: String
}
