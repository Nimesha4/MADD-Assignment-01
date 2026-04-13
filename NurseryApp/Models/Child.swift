//
//  Child.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-04-13.
//

import Foundation

struct Child: Identifiable {
    let id = UUID()
    
    var name: String
    var room: String
    var isPresent: Bool
    var checkInTime: String?
    
    var meal: String?
    var mood: String?
    var notes: String?
}
