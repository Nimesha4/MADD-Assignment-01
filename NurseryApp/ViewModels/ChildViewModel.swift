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
        Child(name: "Emma", room: "Room A", isPresent: true, checkInTime: "8:05 AM", meal: "Full", mood: "Happy", notes: "Participated actively in morning circle."),


            Child(name: "Sophia", room: "Room A", isPresent: true, checkInTime: "8:20 AM", meal: "Full", mood: "Excited", notes: "Played well with friends."),

            Child(name: "Liam", room: "Room C", isPresent: true, checkInTime: "8:25 AM", meal: "Full", mood: "Happy", notes: "Completed puzzle activity."),

            Child(name: "Olivia", room: "Room B", isPresent: true, checkInTime: "8:30 AM", meal: "Half", mood: "Tired", notes: "Needed extra rest after lunch."),

            Child(name: "Noah", room: "Room A", isPresent: true, checkInTime: "8:35 AM", meal: "Full", mood: "Happy", notes: "Participated in storytelling session."),

            Child(name: "Kavii", room: "Room B", isPresent: true, checkInTime: "8:45 AM", meal: "Half", mood: "Calm", notes: "Worked on colouring activity."),

            Child(name: "Lucas", room: "Room C", isPresent: true, checkInTime: "8:55 AM", meal: "Full", mood: "Energetic", notes: "Joined group games enthusiastically."),

            Child(name: "Charlotte", room: "Room B", isPresent: false, checkInTime: nil, meal: nil, mood: nil, notes: nil),

            Child(name: "Benjamin", room: "Room A", isPresent: false, checkInTime: nil, meal: nil, mood: nil, notes: nil)
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
