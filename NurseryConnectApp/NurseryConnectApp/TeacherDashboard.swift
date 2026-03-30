//
//  TeacherDashboard.swift
//  NurseryConnectApp
//
//  Created by Nimesha Jayawickrama on 2026-03-30.
//

import SwiftUI

struct TeacherDashboard: View {
    let nurseries: [Nursery] = [
        Nursery(
            name: "Nursery A",
            children: [
                Child(name: "Alice", napTime: "10:00 - 11:00", meal: "Breakfast - 80% eaten", mood: "Happy 😊"),
                Child(name: "Charlie", napTime: "11:00 - 11:30", meal: "Snack - 90% eaten", mood: "Calm 😌")
            ]
        ),
        Nursery(
            name: "Nursery B",
            children: [
                Child(name: "Bob", napTime: "11:00 - 12:00", meal: "Lunch - 70% eaten", mood: "Excited 😄"),
                Child(name: "Daisy", napTime: "10:30 - 11:15", meal: "Breakfast - 100% eaten", mood: "Happy 😁")
            ]
        )
    ]

    private func nurseryGradient(_ index: Int) -> [Color] {
        let palettes: [[Color]] = [
            [Color(red: 0.28, green: 0.80, blue: 0.60), Color(red: 0.18, green: 0.60, blue: 0.88)],
            [Color(red: 0.55, green: 0.38, blue: 0.95), Color(red: 0.88, green: 0.38, blue: 0.72)],
            [Color(red: 1.0,  green: 0.55, blue: 0.30), Color(red: 0.95, green: 0.35, blue: 0.52)],
            [Color(red: 0.28, green: 0.68, blue: 0.95), Color(red: 0.18, green: 0.45, blue: 0.80)],
        ]
        return palettes[index % palettes.count]
    }

    var body: some View {
         
            ZStack {
                // ── Background ──────────────────────────────────────
                Color(red: 0.96, green: 0.97, blue: 0.99)
                    .ignoresSafeArea()

                Ellipse()
                    .fill(Color(red: 0.42, green: 0.88, blue: 0.68).opacity(0.28))
                    .frame(width: 320, height: 260)
                    .blur(radius: 110)
                    .offset(x: 130, y: -260)
                    .allowsHitTesting(false)

                Ellipse()
                    .fill(Color(red: 0.55, green: 0.72, blue: 0.98).opacity(0.26))
                    .frame(width: 280, height: 220)
                    .blur(radius: 100)
                    .offset(x: -120, y: 240)
                    .allowsHitTesting(false)

                // ── Layout ──────────────────────────────────────────
                VStack(spacing: 0) {

                    // ── Header ──────────────────────────────────────
                    VStack(spacing: 6) {
                        // Initial badge — clean, no emoji
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [Color(red: 0.28, green: 0.78, blue: 0.58),
                                                 Color(red: 0.18, green: 0.52, blue: 0.88)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 78, height: 78)
                                .shadow(color: Color(red: 0.22, green: 0.68, blue: 0.55).opacity(0.32),
                                        radius: 18, x: 0, y: 10)

                            Text("J")
                                .font(.system(size: 34, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .padding(.top, 16)

                        Text("Welcome, Mr. John!")
                            .font(.system(size: 26, weight: .heavy, design: .rounded))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [Color(red: 0.10, green: 0.45, blue: 0.35),
                                             Color(red: 0.15, green: 0.42, blue: 0.80)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .multilineTextAlignment(.center)

                        Text("Have a wonderful day")
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundColor(Color(red: 0.38, green: 0.55, blue: 0.50))
                    }
                    .padding(.bottom, 24)

                    // ── Section divider ──────────────────────────────
                    HStack {
                        Rectangle()
                            .fill(Color(red: 0.42, green: 0.70, blue: 0.58).opacity(0.30))
                            .frame(height: 1)
                        Text("YOUR NURSERIES")
                            .font(.system(size: 10, weight: .semibold, design: .rounded))
                            .foregroundColor(Color(red: 0.28, green: 0.52, blue: 0.44))
                            .tracking(2)
                            .fixedSize()
                        Rectangle()
                            .fill(Color(red: 0.42, green: 0.70, blue: 0.58).opacity(0.30))
                            .frame(height: 1)
                    }
                    .padding(.horizontal, 28)
                    .padding(.bottom, 8)

                    // ── Nursery List ─────────────────────────────────
                    List(Array(nurseries.enumerated()), id: \.element.id) { index, nursery in
                        NavigationLink(destination: NurseryDetailView(nursery: nursery )) {
                            HStack(spacing: 16) {

                                // Coloured initial badge
                                ZStack {
                                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                                        .fill(
                                            LinearGradient(
                                                colors: nurseryGradient(index),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                        .frame(width: 50, height: 50)
                                        .shadow(color: nurseryGradient(index).first?.opacity(0.28) ?? .clear,
                                                radius: 8, x: 0, y: 4)

                                    Text(String(nursery.name.prefix(1)))
                                        .font(.system(size: 20, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                }

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(nursery.name)
                                        .font(.system(size: 15, weight: .bold, design: .rounded))
                                        .foregroundColor(Color(red: 0.12, green: 0.30, blue: 0.26))

                                    HStack(spacing: 4) {
                                        Image(systemName: "person.2.fill")
                                            .font(.system(size: 11))
                                            .foregroundColor(Color(red: 0.38, green: 0.62, blue: 0.52))
                                        Text("\(nursery.children.count) children enrolled")
                                            .font(.system(size: 12, design: .rounded))
                                            .foregroundColor(Color(red: 0.38, green: 0.52, blue: 0.46))
                                    }
                                }

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(Color(red: 0.45, green: 0.65, blue: 0.56).opacity(0.70))
                            }
                            .padding(.horizontal, 14)
                            .padding(.vertical, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 18, style: .continuous)
                                    .fill(Color(.systemBackground))
                                    .shadow(color: Color(red: 0.25, green: 0.60, blue: 0.46).opacity(0.09),
                                            radius: 10, x: 0, y: 5)
                            )
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 20))
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)

                    Spacer()

                    // ── Footer ───────────────────────────────────────
                    HStack(spacing: 5) {
                        Image(systemName: "sparkles")
                            .font(.system(size: 11))
                            .foregroundColor(Color(red: 0.95, green: 0.72, blue: 0.25))
                        Text("Shaping little futures, one day at a time")
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(Color(red: 0.45, green: 0.58, blue: 0.52))
                    }
                    .padding(.bottom, 28)
                }
                .padding(.horizontal)
            }
            .navigationTitle("Teacher Dashboard")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

struct TeacherDashboard_Previews: PreviewProvider {
    static var previews: some View {
        TeacherDashboard()
    }
}
