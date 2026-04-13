//
//  AttendanceView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-04-13.
//

import SwiftUI

struct AttendanceView: View {
    @EnvironmentObject var vm: ChildViewModel
    @State private var showSettings = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    
                    HStack(spacing: 10) {
                        statCard(title: "Present",
                                 count: vm.children.filter{$0.isPresent}.count,
                                 color: .green)
                        
                        statCard(title: "Absent",
                                 count: vm.children.filter{!$0.isPresent}.count,
                                 color: .gray)
                    }
                    
                    ForEach(vm.children) { child in
                        
                        HStack(spacing: 10) {
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text(child.name)
                                    .font(.subheadline)
                                    .bold()
                                
                                Text(child.room)
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            statusBadge(
                                text: child.isPresent ? "Present" : "Absent",
                                color: child.isPresent ? .green : .gray
                            )
                            
                            if let time = child.checkInTime, child.isPresent {
                                Text(time)
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                            
                            Button {
                                toggleAttendance(child)
                            } label: {
                                Text(child.isPresent ? "Out" : "In")
                                    .font(.caption2)
                                    .bold()
                            }
                            
                            Button {
                                deleteChild(child)
                            } label: {
                                Image(systemName: "trash")
                                    .font(.caption)
                            }
                            .foregroundColor(.red)
                        }
                        .padding(10)
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.04), radius: 3)
                    }
                }
                .padding()
            }
            .background(Color(.systemGray6))
            .navigationTitle("Attendance")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSettings = true
                    } label: {
                        Image(systemName: "gearshape.fill")
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
        }
    }
    
    func toggleAttendance(_ child: Child) {
        if child.isPresent {
            vm.checkOut(child: child)
        } else {
            vm.checkIn(child: child)
        }
    }
    
    func deleteChild(_ child: Child) {
        vm.children.removeAll { $0.id == child.id }
    }
    
    func statCard(title: String, count: Int, color: Color) -> some View {
        VStack {
            Text("\(count)")
                .font(.headline)
                .bold()
                .foregroundColor(color)
            
            Text(title)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }
    
    // used same styles
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
