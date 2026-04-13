//
//  SummaryView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-04-13.
//

import SwiftUI

struct SummaryView: View {
    @EnvironmentObject var vm: ChildViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 12) {
                        
                        navCard(title: "Full Meals",
                                count: vm.children.filter{$0.meal=="Full"}.count,
                                color: .green,
                                list: vm.children.filter{$0.meal=="Full"})
                        
                        navCard(title: "Half Meals",
                                count: vm.children.filter{$0.meal=="Half"}.count,
                                color: .orange,
                                list: vm.children.filter{$0.meal=="Half"})
                        
                        navCard(title: "No Meals",
                                count: vm.children.filter{$0.meal=="None"}.count,
                                color: .red,
                                list: vm.children.filter{$0.meal=="None"})
                        
                        navCard(title: "Pending",
                                count: vm.children.filter{$0.meal==nil && $0.isPresent}.count,
                                color: .gray,
                                list: vm.children.filter{$0.meal==nil && $0.isPresent})
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Meal Breakdown")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        ForEach(vm.children.filter{$0.isPresent}) { child in
                            
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Text(child.name)
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                    
                                    Spacer()
                                    
                                    Text(child.meal ?? "Pending")
                                        .font(.caption)
                                        .padding(5)
                                        .background(colorForMeal(child.meal).opacity(0.2))
                                        .cornerRadius(8)
                                }
                                
                                ProgressView(value: progressValue(child.meal))
                                    .tint(colorForMeal(child.meal))
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.05), radius: 5)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Mood Overview")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        HStack(spacing: 12) {
                            
                            navMood(title: "Happy",
                                    count: vm.children.filter{$0.mood=="Happy"}.count,
                                    color: .green,
                                    list: vm.children.filter{$0.mood=="Happy"})
                            
                            navMood(title: "Tired",
                                    count: vm.children.filter{$0.mood=="Tired"}.count,
                                    color: .orange,
                                    list: vm.children.filter{$0.mood=="Tired"})
                            
                            navMood(title: "Sick",
                                    count: vm.children.filter{$0.mood=="Sick"}.count,
                                    color: .red,
                                    list: vm.children.filter{$0.mood=="Sick"})
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.05), radius: 5)
                }
                .padding()
            }
            .background(Color(.systemGray6))
            .navigationTitle("Summary")
        }
    }
    
    func navCard(title: String, count: Int, color: Color, list: [Child]) -> some View {
        NavigationLink(destination: FilteredListView(title: title, children: list)) {
            VStack(alignment: .leading) {
                Text("\(count)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(color)
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 90)
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.05), radius: 5)
        }
    }
    
    func navMood(title: String, count: Int, color: Color, list: [Child]) -> some View {
        NavigationLink(destination: FilteredListView(title: title, children: list)) {
            VStack {
                Circle()
                    .fill(color)
                    .frame(width: 12, height: 12)
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(.primary)
                
                Text("\(count)")
                    .bold()
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    func progressValue(_ meal: String?) -> Double {
        switch meal {
        case "Full": return 1.0
        case "Half": return 0.5
        case "None": return 0.1
        default: return 0.0
        }
    }
}
