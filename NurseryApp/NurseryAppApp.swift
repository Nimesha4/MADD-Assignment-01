//
//  NurseryAppApp.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-04-13.
//

import SwiftUI

@main
struct NurseryAppApp: App {
    @StateObject var vm = ChildViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    @StateObject private var incidentVM = IncidentViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainSplitView()
                .environmentObject(vm)
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(incidentVM)
        }
    }
}
