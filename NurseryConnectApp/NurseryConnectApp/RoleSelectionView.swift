//
//  RoleSelectionView.swift
//  NurseryConnectApp
//
//  Created by Nimesha Jayawickrama on 2026-03-30.
//

//
//  RoleSelectionView.swift
//  NurseryConnectApp
//

import SwiftUI

struct RoleSelectionView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // ── Background ──────────────────────────────────────
                Color(red: 0.97, green: 0.95, blue: 0.99)
                    .ignoresSafeArea()

                // Blobs
                Ellipse()
                    .fill(Color(red: 1.0, green: 0.78, blue: 0.88).opacity(0.50))
                    .frame(width: 340, height: 280)
                    .blur(radius: 110)
                    .offset(x: -130, y: -280)
                    .allowsHitTesting(false)

                Ellipse()
                    .fill(Color(red: 0.68, green: 0.80, blue: 1.0).opacity(0.42))
                    .frame(width: 300, height: 240)
                    .blur(radius: 100)
                    .offset(x: 140, y: 200)
                    .allowsHitTesting(false)

                Ellipse()
                    .fill(Color(red: 0.80, green: 0.95, blue: 0.82).opacity(0.38))
                    .frame(width: 220, height: 180)
                    .blur(radius: 90)
                    .offset(x: 60, y: -180)
                    .allowsHitTesting(false)

                // ── Main Layout (mirrors original VStack spacing: 40) ─
                VStack(spacing: 40) {

                    // Header (replaces plain Text "Nursery Connect")
                    VStack(spacing: 8) {
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [Color(red: 1.0, green: 0.58, blue: 0.72),
                                                 Color(red: 0.72, green: 0.48, blue: 0.97)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 86, height: 86)
                                .shadow(color: Color(red: 0.88, green: 0.42, blue: 0.72).opacity(0.36),
                                        radius: 20, x: 0, y: 10)
                            Text("🌱")
                                .font(.system(size: 40))
                        }
                        .padding(.top, 16)

                        Text("Nursery Connect")
                            .font(.system(size: 32, weight: .heavy, design: .rounded))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [Color(red: 0.50, green: 0.18, blue: 0.68),
                                             Color(red: 0.92, green: 0.30, blue: 0.52)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )

                        Text("Who are you today?")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundColor(Color(red: 0.58, green: 0.46, blue: 0.65))
                    }

                    // Role cards
                    VStack(spacing: 16) {

                        // NavigationLink → ParentDashboard (destination unchanged)
                        NavigationLink(destination: ParentDashboard()) {
                            HStack(spacing: 14) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .fill(.white.opacity(0.22))
                                        .frame(width: 48, height: 48)
                                    Text("👨‍👩‍👧")
                                        .font(.system(size: 22))
                                }
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("I am a Parent")
                                        .font(.system(size: 16, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                    Text("Track updates, meals & mood")
                                        .font(.system(size: 12, design: .rounded))
                                        .foregroundColor(.white.opacity(0.80))
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white.opacity(0.70))
                            }
                            .padding(.horizontal, 18)
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(
                                    colors: [Color(red: 1.0, green: 0.52, blue: 0.70),
                                             Color(red: 0.92, green: 0.32, blue: 0.52)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                            .shadow(color: Color(red: 0.95, green: 0.40, blue: 0.58).opacity(0.36),
                                    radius: 14, x: 0, y: 8)
                        }

                        // NavigationLink → TeacherDashboard (destination unchanged)
                        NavigationLink(destination: TeacherDashboard()) {
                            HStack(spacing: 14) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .fill(.white.opacity(0.22))
                                        .frame(width: 48, height: 48)
                                    Text("🧑‍🏫")
                                        .font(.system(size: 22))
                                }
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("I am a Teacher")
                                        .font(.system(size: 16, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                    Text("Log activities & care notes")
                                        .font(.system(size: 12, design: .rounded))
                                        .foregroundColor(.white.opacity(0.80))
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white.opacity(0.70))
                            }
                            .padding(.horizontal, 18)
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(
                                    colors: [Color(red: 0.30, green: 0.78, blue: 0.60),
                                             Color(red: 0.16, green: 0.62, blue: 0.50)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                            .shadow(color: Color(red: 0.20, green: 0.68, blue: 0.52).opacity(0.36),
                                    radius: 14, x: 0, y: 8)
                        }
                    }
                    .padding(.horizontal, 24)

                    Spacer()

                    // Footer
                    HStack(spacing: 18) {
                        Label("Secure", systemImage: "lock.fill")
                        Label("Private", systemImage: "eye.slash.fill")
                        Label("Trusted", systemImage: "checkmark.seal.fill")
                    }
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundColor(Color(red: 0.65, green: 0.55, blue: 0.72))
                    .padding(.bottom, 28)
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct RoleSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        RoleSelectionView()
    }
}
