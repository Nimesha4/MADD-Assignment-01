//
//  KeyworkerRoleView.swift
//  NurseryConnectApp
//
//  Created by Nimesha Jayawickrama on 2026-03-30.
//


import SwiftUI

struct KeyworkerRoleView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // ── Background ──────────────────────────────────────
                Color(red: 0.96, green: 0.97, blue: 1.0)
                    .ignoresSafeArea()

                // Blobs
                Ellipse()
                    .fill(Color(red: 0.55, green: 0.72, blue: 1.0).opacity(0.38))
                    .frame(width: 320, height: 260)
                    .blur(radius: 105)
                    .offset(x: 130, y: -280)
                    .allowsHitTesting(false)

                Ellipse()
                    .fill(Color(red: 0.72, green: 0.58, blue: 1.0).opacity(0.32))
                    .frame(width: 260, height: 220)
                    .blur(radius: 95)
                    .offset(x: -110, y: 220)
                    .allowsHitTesting(false)

                // ── Main Layout (mirrors original VStack spacing: 20) ─
                VStack(spacing: 20) {

                    // Header (replaces plain Text "Keyworker Dashboard")
                    VStack(spacing: 8) {
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [Color(red: 0.38, green: 0.58, blue: 1.0),
                                                 Color(red: 0.55, green: 0.38, blue: 0.95)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 80, height: 80)
                                .shadow(color: Color(red: 0.40, green: 0.52, blue: 0.95).opacity(0.36),
                                        radius: 18, x: 0, y: 10)
                            Text("🧑‍🏫")
                                .font(.system(size: 36))
                        }
                        .padding(.top, 16)

                        Text("Keyworker Dashboard")
                            .font(.system(size: 28, weight: .heavy, design: .rounded))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [Color(red: 0.28, green: 0.35, blue: 0.85),
                                             Color(red: 0.55, green: 0.35, blue: 0.95)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .multilineTextAlignment(.center)

                        Text("Manage daily care with ease")
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundColor(Color(red: 0.50, green: 0.45, blue: 0.68))
                    }

                    // Divider
                    HStack {
                        Rectangle()
                            .fill(Color(red: 0.70, green: 0.65, blue: 0.90).opacity(0.35))
                            .frame(height: 1)
                        Text("TODAY'S TASKS")
                            .font(.system(size: 10, weight: .semibold, design: .rounded))
                            .foregroundColor(Color(red: 0.55, green: 0.48, blue: 0.72))
                            .tracking(2)
                            .fixedSize()
                        Rectangle()
                            .fill(Color(red: 0.70, green: 0.65, blue: 0.90).opacity(0.35))
                            .frame(height: 1)
                    }
                    .padding(.horizontal, 28)

                    // ── Task Cards ──────────────────────────────────
                    // "Log Activities" (original Text unchanged as label)
                    HStack(spacing: 16) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(Color(red: 0.38, green: 0.58, blue: 1.0).opacity(0.14))
                                .frame(width: 48, height: 48)
                            Text("📋")
                                .font(.system(size: 22))
                        }
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Log Activities")
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                .foregroundColor(Color(red: 0.22, green: 0.28, blue: 0.55))
                            Text("Record play, learning & events")
                                .font(.system(size: 12, design: .rounded))
                                .foregroundColor(Color(red: 0.55, green: 0.52, blue: 0.68))
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(Color(red: 0.55, green: 0.52, blue: 0.72))
                    }
                    .padding(.horizontal, 18)
                    .padding(.vertical, 14)
                    .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(Color(.systemBackground))
                            .shadow(color: Color(red: 0.40, green: 0.50, blue: 0.90).opacity(0.10),
                                    radius: 10, x: 0, y: 5)
                    )
                    .padding(.horizontal, 24)

                    // "Record Meals"
                    HStack(spacing: 16) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(Color(red: 0.25, green: 0.78, blue: 0.58).opacity(0.14))
                                .frame(width: 48, height: 48)
                            Text("🍽️")
                                .font(.system(size: 22))
                        }
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Record Meals")
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                .foregroundColor(Color(red: 0.12, green: 0.42, blue: 0.32))
                            Text("Log what & how much was eaten")
                                .font(.system(size: 12, design: .rounded))
                                .foregroundColor(Color(red: 0.42, green: 0.58, blue: 0.52))
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(Color(red: 0.38, green: 0.62, blue: 0.52))
                    }
                    .padding(.horizontal, 18)
                    .padding(.vertical, 14)
                    .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(Color(.systemBackground))
                            .shadow(color: Color(red: 0.25, green: 0.68, blue: 0.50).opacity(0.10),
                                    radius: 10, x: 0, y: 5)
                    )
                    .padding(.horizontal, 24)

                    // "Log Sleep/Nap"
                    HStack(spacing: 16) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(Color(red: 0.62, green: 0.45, blue: 0.98).opacity(0.14))
                                .frame(width: 48, height: 48)
                            Text("🌙")
                                .font(.system(size: 22))
                        }
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Log Sleep / Nap")
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                .foregroundColor(Color(red: 0.32, green: 0.22, blue: 0.58))
                            Text("Track nap times & sleep quality")
                                .font(.system(size: 12, design: .rounded))
                                .foregroundColor(Color(red: 0.52, green: 0.45, blue: 0.72))
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(Color(red: 0.55, green: 0.42, blue: 0.80))
                    }
                    .padding(.horizontal, 18)
                    .padding(.vertical, 14)
                    .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(Color(.systemBackground))
                            .shadow(color: Color(red: 0.55, green: 0.40, blue: 0.90).opacity(0.10),
                                    radius: 10, x: 0, y: 5)
                    )
                    .padding(.horizontal, 24)

                    Spacer()

                    // Footer
                    HStack(spacing: 6) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color(red: 0.95, green: 0.45, blue: 0.60))
                            .font(.system(size: 11))
                        Text("Every detail matters for every child")
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(Color(red: 0.62, green: 0.55, blue: 0.72))
                    }
                    .padding(.bottom, 28)
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct KeyworkerRoleView_Previews: PreviewProvider {
    static var previews: some View {
        KeyworkerRoleView()
    }
}
