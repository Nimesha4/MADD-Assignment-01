//
//  Nursery.swift
//  NurseryConnectApp
//
//  Created by Nimesha Jayawickrama on 2026-03-30.
//

// Nursery.swift
import Foundation

struct Nursery: Identifiable {
    var id = UUID()
    var name: String
    var children: [Child]
}
