//
//  SettingsView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-04-13.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationStack {
            List {
                
                // Profile
                Section {
                    HStack {
                        Circle()
                            .fill(Color.blue.opacity(0.2))
                            .frame(width: 50, height: 50)
                            .overlay(Text("NJ").bold())
                        
                        VStack(alignment: .leading) {
                            Text("Nimesha Jayawickrama")
                                .font(.headline)
                            
                            Text("Catering Staff")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                // Appearance
                Section(header: Text("Appearance")) {
                    Toggle(isOn: $isDarkMode) {
                        Label("Dark Mode", systemImage: "moon.fill")
                    }
                }
                
                // App Info
                Section(header: Text("About")) {
                    Label("Version 1.0", systemImage: "info.circle")
                    Label("Nursery Management App", systemImage: "leaf")
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
