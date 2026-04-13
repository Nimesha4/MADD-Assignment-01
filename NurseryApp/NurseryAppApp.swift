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
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(vm)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
