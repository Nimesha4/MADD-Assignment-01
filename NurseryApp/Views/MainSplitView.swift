//
//  MainSplitView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-06-01.
//

import SwiftUI

struct MainSplitView: View {

    var body: some View {

        NavigationSplitView {

            List {

                NavigationLink("Attendance") {
                    AttendanceView()
                }

                NavigationLink("Diary") {
                    DiaryView()
                }

                NavigationLink("Dashboard") {
                    DashboardView(
                        childVM: ChildViewModel(),
                        incidentVM: IncidentViewModel()
                    )
                }
            }

        } detail: {

            Text("Select a Section")
        }
    }
}
