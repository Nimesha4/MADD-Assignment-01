//
//  MainTabView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-04-13.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        
        TabView {
            
            NavigationStack {
                AttendanceView()
            }
            .tabItem {
                Label("Attendance", systemImage: "person.3")
            }
            
            NavigationStack {
                DiaryView()
            }
            .tabItem {
                Label("Diary", systemImage: "book")
            }
            
            NavigationStack {
                SummaryView()
            }
            .tabItem {
                Label("Summary", systemImage: "chart.bar")
            }
            NavigationStack {
                GalleryView()
            }
            .tabItem {
                Label("Gallery", systemImage: "photo")
            }
            
        }
    }
}
