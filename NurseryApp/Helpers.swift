//
//  Helpers.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-04-13.
//

import SwiftUI

func colorForMeal(_ meal: String?) -> Color {
    switch meal {
    case "Full": return .green
    case "Half": return .orange
    case "None": return .red
    default: return .gray
    }
}

func colorForMood(_ mood: String?) -> Color {
    switch mood {
    case "Happy": return .green
    case "Tired": return .orange
    case "Sick": return .red
    default: return .gray
    }
}
