//
//  AddEditEntryView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-04-13.
//

import SwiftUI

struct AddEditEntryView: View {
    @EnvironmentObject var vm: ChildViewModel
    @Environment(\.dismiss) var dismiss
    
    var child: Child
    
    @State private var meal = "Full"
    @State private var mood = "Happy"
    @State private var notes = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                Text("Edit Entry")
                    .font(.title2)
                    .bold()
                
                // Child info
                Text(child.name)
                    .font(.headline)
                
                Text(child.room)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                // Meal
                Picker("Meal", selection: $meal) {
                    Text("Full").tag("Full")
                    Text("Half").tag("Half")
                    Text("None").tag("None")
                }
                .pickerStyle(.segmented)
                
                // Mood
                Picker("Mood", selection: $mood) {
                    Text("Happy").tag("Happy")
                    Text("Tired").tag("Tired")
                    Text("Sick").tag("Sick")
                }
                .pickerStyle(.segmented)
                
                // Notes
                TextField("Notes", text: $notes)
                    .textFieldStyle(.roundedBorder)
                
                // Save button
                Button {
                    vm.updateDiary(child: child, meal: meal, mood: mood, notes: notes)
                    dismiss()
                } label: {
                    Text("Save Entry")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }
            }
            .padding()
        }
        .navigationTitle("Edit Entry")
        .onAppear {
            meal = child.meal ?? "Full"
            mood = child.mood ?? "Happy"
            notes = child.notes ?? ""
        }
    }
}
