//
//  FilteredListView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-04-13.
//

import SwiftUI

struct FilteredListView: View {
    var title: String
    var children: [Child]
    
    var body: some View {
        NavigationStack {
            
            if children.isEmpty {
                
                // EMPTY STATE
                VStack(spacing: 12) {
                    Image(systemName: "tray")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                    
                    Text("No Data Available")
                        .font(.headline)
                    
                    Text("No records found for this category")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.systemGray6))
                
            } else {
                
                ScrollView {
                    VStack(spacing: 12) {
                        
                        ForEach(children) { child in
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                HStack {
                                    Text(child.name)
                                        .font(.headline)
                                    
                                    Spacer()
                                    
                                    statusBadge(
                                        text: child.isPresent ? "Present" : "Absent",
                                        color: child.isPresent ? .green : .gray
                                    )
                                }
                                
                                HStack {
                                    chip(text: child.meal ?? "Pending",
                                         color: colorForMeal(child.meal))
                                    
                                    chip(text: child.mood ?? "-",
                                         color: colorForMood(child.mood))
                                }
                                
                                if let notes = child.notes {
                                    Text(notes)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.05), radius: 5)
                        }
                    }
                    .padding()
                }
                .background(Color(.systemGray6))
            }
        }
        .navigationTitle(title)
    }
    
    // CHIP
    func chip(text: String, color: Color) -> some View {
        Text(text)
            .font(.caption)
            .fontWeight(.medium)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .foregroundColor(color)
            .background(color.opacity(0.18))
            .cornerRadius(10)
    }
    
    // STATUS
    func statusBadge(text: String, color: Color) -> some View {
        Text(text)
            .font(.caption)
            .fontWeight(.medium)
            .padding(.horizontal, 6)
            .padding(.vertical, 3)
            .foregroundColor(color)
            .background(color.opacity(0.18))
            .cornerRadius(6)
    }
}
