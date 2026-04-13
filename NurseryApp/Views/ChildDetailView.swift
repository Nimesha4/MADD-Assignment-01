//
//  ChildDetailView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-04-13.
//

import SwiftUI

struct ChildDetailView: View {
    var child: Child
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                
                Text(child.name)
                    .font(.title)
                    .bold()
                
                Text(child.room)
                    .foregroundColor(.gray)
                
                Text(child.isPresent ? "Present" : "Absent")
                    .foregroundColor(child.isPresent ? .green : .gray)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Today's Entry")
                        .font(.headline)
                    
                    Text("Meal: \(child.meal ?? "-")")
                    Text("Mood: \(child.mood ?? "-")")
                    Text("Notes: \(child.notes ?? "-")")
                }
                
                Divider()
                
                NavigationLink("Edit Entry") {
                    AddEditEntryView(child: child)
                }
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Child Detail")
    }
}
