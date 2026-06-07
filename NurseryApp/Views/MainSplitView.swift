//
//  MainSplitView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-06-01.
//

import SwiftUI

struct MainSplitView: View {

    @EnvironmentObject var childVM: ChildViewModel
    @EnvironmentObject var incidentVM: IncidentViewModel

    var body: some View {

        NavigationSplitView {

            List {

                NavigationLink {

                    AttendanceView()

                } label: {

                    Label(
                        "Attendance",
                        systemImage: "person.3"
                    )
                }

                NavigationLink {

                    DiaryView()

                } label: {

                    Label(
                        "Diary",
                        systemImage: "book"
                    )
                }

                NavigationLink {

                    SummaryView()

                } label: {

                    Label(
                        "Summary",
                        systemImage: "chart.bar"
                    )
                }

                NavigationLink {

                    GalleryView()

                } label: {

                    Label(
                        "Gallery",
                        systemImage: "photo"
                    )
                }

                NavigationLink {

                    DashboardView(
                        childVM: childVM,
                        incidentVM: incidentVM
                    )

                } label: {

                    Label(
                        "Dashboard",
                        systemImage: "square.grid.2x2"
                    )
                }
            }
            .navigationTitle("Nursery")

        } detail: {

            DashboardView(
                childVM: childVM,
                incidentVM: incidentVM
            )
        }
    }
}

#Preview {

    MainSplitView()
        .environmentObject(ChildViewModel())
        .environmentObject(IncidentViewModel())
}
