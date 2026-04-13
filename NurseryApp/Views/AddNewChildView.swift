//
//  AddNewChildView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-04-13.
//

import SwiftUI

struct AddNewChildView: View {
    @EnvironmentObject var vm: ChildViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var room = ""
    @State private var meal = "Full"
    @State private var mood = "Happy"
    @State private var notes = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                Text("Add New Entry")
                    .font(.title2)
                    .bold()
                
                TextField("Child Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Room", text: $room)
                    .textFieldStyle(.roundedBorder)
                
                Picker("Meal", selection: $meal) {
                    Text("Full").tag("Full")
                    Text("Half").tag("Half")
                    Text("None").tag("None")
                }
                .pickerStyle(.segmented)
                
                Picker("Mood", selection: $mood) {
                    Text("Happy").tag("Happy")
                    Text("Tired").tag("Tired")
                    Text("Sick").tag("Sick")
                }
                .pickerStyle(.segmented)
                
                TextField("Notes", text: $notes)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    addChild()
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
        .navigationTitle("New Entry")
    }
    
    func addChild() {
        let newChild = Child(
            name: name,
            room: room,
            isPresent: true,
            checkInTime: vm.currentTime(),
            meal: meal,
            mood: mood,
            notes: notes
        )
        
        vm.children.append(newChild)
    }
}
