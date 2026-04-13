//
//  ChildViewModel.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-04-13.
//


import SwiftUI
import Combine
import Foundation

class ChildViewModel: ObservableObject {
    @Published var children: [Child] = [
        Child(name: "John", room: "Room A", isPresent: true, checkInTime: "8:30 AM", meal: "Full", mood: "Happy", notes: "Good"),
        Child(name: "Anna", room: "Room B", isPresent: true, checkInTime: "8:45 AM", meal: "Half", mood: "Tired", notes: "Sleepy"),
        Child(name: "Liam", room: "Room A", isPresent: false, checkInTime: nil, meal: nil, mood: nil, notes: nil)
    ]
    
    func checkIn(child: Child) {
        if let index = children.firstIndex(where: { $0.id == child.id }) {
            children[index].isPresent = true
            children[index].checkInTime = currentTime()
        }
    }
    
    func checkOut(child: Child) {
        if let index = children.firstIndex(where: { $0.id == child.id }) {
            children[index].isPresent = false
            children[index].checkInTime = nil
        }
    }
    
    func updateDiary(child: Child, meal: String, mood: String, notes: String) {
        if let index = children.firstIndex(where: { $0.id == child.id }) {
            children[index].meal = meal
            children[index].mood = mood
            children[index].notes = notes
        }
    }
    
    func currentTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: Date())
    }
}
