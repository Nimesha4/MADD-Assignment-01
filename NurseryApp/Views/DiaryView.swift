//
//  DiaryView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-04-13.
//

import SwiftUI

struct DiaryView: View {
    @EnvironmentObject var vm: ChildViewModel
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                ScrollView {
                    VStack(spacing: 10) {
                        
                        ForEach(vm.children.filter { $0.isPresent }) { child in
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                HStack {
                                    Text(child.name)
                                        .font(.subheadline)
                                        .bold()
                                        .foregroundColor(.primary)
                                    
                                    Spacer()
                                    
                                    statusBadge(text: "Present", color: .green)
                                }
                                
                                HStack(spacing: 6) {
                                    chip(text: child.meal ?? "Pending",
                                         color: colorForMeal(child.meal))
                                    
                                    chip(text: child.mood ?? "-",
                                         color: colorForMood(child.mood))
                                }
                                
                                HStack {
                                    NavigationLink(destination: AddEditEntryView(child: child)) {
                                        Text("Edit")
                                            .font(.caption2)
                                            .bold()
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 4)
                                            .background(Color.blue.opacity(0.15))
                                            .cornerRadius(8)
                                    }
                                    
                                    Spacer()
                                    
                                    Button {
                                        deleteChild(child)
                                    } label: {
                                        Image(systemName: "trash")
                                            .font(.caption)
                                    }
                                    .foregroundColor(.red)
                                }
                            }
                            .padding(10)
                            .background(Color(.systemBackground))
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.04), radius: 3)
                        }
                    }
                    .padding()
                }
                
                NavigationLink(destination: AddNewChildView()) {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add New Entry")
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
                .padding()
            }
            .background(Color(.systemGray6))
            .navigationTitle("Diary")
        }
    }
    
    func deleteChild(_ child: Child) {
        vm.children.removeAll { $0.id == child.id }
    }
    
    //  MODERN CHIP
    func chip(text: String, color: Color) -> some View {
        Text(text)
            .font(.caption2)
            .fontWeight(.medium)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .foregroundColor(color) // strong text
            .background(color.opacity(0.18)) // soft fill
            .cornerRadius(8)
    }
    
    // STATUS BADGE
    func statusBadge(text: String, color: Color) -> some View {
        Text(text)
            .font(.caption2)
            .fontWeight(.medium)
            .padding(.horizontal, 6)
            .padding(.vertical, 3)
            .foregroundColor(color)
            .background(color.opacity(0.18))
            .cornerRadius(6)
    }
}
