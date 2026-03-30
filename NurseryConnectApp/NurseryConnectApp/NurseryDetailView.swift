//
//  NurseryDetailView.swift
//  NurseryConnectApp
//
//  Created by Nimesha Jayawickrama on 2026-03-30.
//


import SwiftUI

// MARK: - Mood & Avatar helpers (consistent with rest of app)
private extension String {
    
    var moodAccent: Color {
        let l = self.lowercased()
        if l.contains("happy") || l.contains("excited") { return Color(red: 1.0,  green: 0.72, blue: 0.20) }
        if l.contains("calm")                            { return Color(red: 0.42, green: 0.82, blue: 0.65) }
        if l.contains("sad")                             { return Color(red: 0.45, green: 0.65, blue: 0.95) }
        if l.contains("tired")                           { return Color(red: 0.72, green: 0.58, blue: 0.95) }
        if l.contains("angry")                           { return Color(red: 0.95, green: 0.42, blue: 0.40) }
        return Color(red: 0.55, green: 0.82, blue: 0.70)
    }

    var avatarGradient: [Color] {
        let l = self.lowercased()
        if l.hasPrefix("a") || l.hasPrefix("e") || l.hasPrefix("i") {
            return [Color(red: 1.0, green: 0.55, blue: 0.72), Color(red: 0.88, green: 0.32, blue: 0.55)]
        }
        if l.hasPrefix("b") || l.hasPrefix("c") || l.hasPrefix("d") {
            return [Color(red: 0.38, green: 0.62, blue: 1.0), Color(red: 0.55, green: 0.38, blue: 0.95)]
        }
        if l.hasPrefix("d") || l.hasPrefix("f") || l.hasPrefix("g") {
            return [Color(red: 0.30, green: 0.80, blue: 0.60), Color(red: 0.16, green: 0.58, blue: 0.80)]
        }
        return [Color(red: 1.0, green: 0.65, blue: 0.30), Color(red: 0.92, green: 0.38, blue: 0.28)]
    }
}

// MARK: - NurseryChildCard (mirrors ChildCardView style)
private struct NurseryChildCard: View {
    
    let child: Child

    var body: some View {
        HStack(spacing: 15) {

            // Gradient avatar circle with initial
            Circle()
                .fill(
                    LinearGradient(
                        colors: child.name.avatarGradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 58, height: 58)
                .shadow(color: child.name.avatarGradient.first?.opacity(0.32) ?? .clear,
                        radius: 10, x: 0, y: 5)
                .overlay(
                    Text(String(child.name.prefix(1)))
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                )

            VStack(alignment: .leading, spacing: 5) {
                Text(child.name)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(Color(red: 0.18, green: 0.14, blue: 0.30))

                HStack(spacing: 5) {
                    Image(systemName: "moon.fill")
                        .font(.system(size: 10))
                        .foregroundColor(Color(red: 0.55, green: 0.42, blue: 0.90))
                    Text(child.napTime)
                        .font(.system(size: 12, design: .rounded))
                        .foregroundColor(Color(red: 0.45, green: 0.38, blue: 0.62))
                    Spacer()
                }

                HStack(spacing: 5) {
                    Image(systemName: "fork.knife")
                        .font(.system(size: 10))
                        .foregroundColor(Color(red: 0.28, green: 0.65, blue: 0.45))
                    Text(child.meal)
                        .font(.system(size: 12, design: .rounded))
                        .foregroundColor(Color(red: 0.28, green: 0.50, blue: 0.38))
                    Spacer()
                }

                HStack(spacing: 5) {
                    Circle()
                        .fill(child.mood.moodAccent)
                        .frame(width: 8, height: 8)
                    Text(child.mood)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(Color(red: 0.36, green: 0.28, blue: 0.50))
                    Spacer()
                }
            }
            .padding(.vertical, 2)

            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(Color(red: 0.65, green: 0.58, blue: 0.78))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color(.systemBackground))
                .shadow(color: Color(red: 0.55, green: 0.40, blue: 0.80).opacity(0.10),
                        radius: 14, x: 0, y: 6)
        )
    }
}

// MARK: - NurseryDetailView
struct NurseryDetailView: View {
    var nursery: Nursery

    var body: some View {
        ZStack {
            // ── Background ──────────────────────────────────────────
            Color(red: 0.97, green: 0.95, blue: 0.99)
                .ignoresSafeArea()

            Ellipse()
                .fill(Color(red: 1.0, green: 0.80, blue: 0.62).opacity(0.40))
                .frame(width: 340, height: 270)
                .blur(radius: 110)
                .offset(x: 130, y: -280)
                .allowsHitTesting(false)

            Ellipse()
                .fill(Color(red: 0.68, green: 0.78, blue: 1.0).opacity(0.35))
                .frame(width: 300, height: 240)
                .blur(radius: 100)
                .offset(x: -130, y: 220)
                .allowsHitTesting(false)

            Ellipse()
                .fill(Color(red: 0.75, green: 0.92, blue: 0.78).opacity(0.28))
                .frame(width: 200, height: 160)
                .blur(radius: 80)
                .offset(x: -60, y: -140)
                .allowsHitTesting(false)

            // ── Main Layout ─────────────────────────────────────────
            VStack(spacing: 20) {

                // ── Hero Header ─────────────────────────────────────
                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [Color(red: 0.30, green: 0.78, blue: 0.58),
                                                 Color(red: 0.18, green: 0.52, blue: 0.90)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 52, height: 52)
                                .shadow(color: Color(red: 0.22, green: 0.68, blue: 0.55).opacity(0.30),
                                        radius: 12, x: 0, y: 6)

                            Text(String(nursery.name.prefix(1)))
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }

                        VStack(alignment: .leading, spacing: 3) {
                            Text(nursery.name)
                                .font(.system(size: 26, weight: .heavy, design: .rounded))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [Color(red: 0.12, green: 0.42, blue: 0.32),
                                                 Color(red: 0.20, green: 0.42, blue: 0.82)],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )

                            Text("\(nursery.children.count) children today")
                                .font(.system(size: 13, weight: .medium, design: .rounded))
                                .foregroundColor(Color(red: 0.38, green: 0.55, blue: 0.48))
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 8)

                // ── Section Divider ─────────────────────────────────
                HStack {
                    Rectangle()
                        .fill(Color(red: 0.42, green: 0.70, blue: 0.58).opacity(0.35))
                        .frame(height: 1)
                    Text("CHILDREN")
                        .font(.system(size: 10, weight: .semibold, design: .rounded))
                        .foregroundColor(Color(red: 0.28, green: 0.52, blue: 0.44))
                        .tracking(2.2)
                        .fixedSize()
                    Rectangle()
                        .fill(Color(red: 0.42, green: 0.70, blue: 0.58).opacity(0.35))
                        .frame(height: 1)
                }
                .padding(.horizontal, 24)

                // ── Scrollable Child Cards ──────────────────────────
                ScrollView {
                    LazyVStack(spacing: 14) {
                        ForEach(nursery.children) { child in
                            NavigationLink(destination: ChildDetailView(
                                childName: child.name,
                                napTime: child.napTime,
                                mealInfo: child.meal,
                                mood: child.mood,
                            )) {
                                NurseryChildCard(child: child)
                                    .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.bottom, 16)
                }

                Spacer()

                // ── Footer ──────────────────────────────────────────
                HStack(spacing: 6) {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 11))
                        .foregroundColor(Color(red: 0.95, green: 0.45, blue: 0.60))
                    Text("Every child cared for, every moment")
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(Color(red: 0.45, green: 0.58, blue: 0.52))
                }
                .padding(.bottom, 24)
            }
        }
        .navigationTitle(nursery.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)

    }
}
