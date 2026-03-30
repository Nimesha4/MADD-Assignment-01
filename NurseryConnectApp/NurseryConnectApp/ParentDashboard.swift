//
//  ParentDashboard.swift
//  NurseryConnectApp
//

//
//  Created by Nimesha Jayawickrama on 2026-03-30.
//

import SwiftUI

// MARK: - Mood color helper (consistent with ChildDetailView)
private extension String {
    var moodAccent: Color {
        let lower = self.lowercased()
        if lower.contains("happy")   { return Color(red: 1.0,  green: 0.78, blue: 0.20) }
        if lower.contains("excited") { return Color(red: 1.0,  green: 0.55, blue: 0.25) }
        if lower.contains("sad")     { return Color(red: 0.45, green: 0.65, blue: 0.95) }
        if lower.contains("tired")   { return Color(red: 0.72, green: 0.58, blue: 0.95) }
        if lower.contains("angry")   { return Color(red: 0.95, green: 0.42, blue: 0.40) }
        return Color(red: 0.42, green: 0.82, blue: 0.65)
    }

    var avatarGradient: [Color] {
        let lower = self.lowercased()
        if lower.hasPrefix("a") || lower.hasPrefix("e") || lower.hasPrefix("i") {
            return [Color(red: 1.0, green: 0.55, blue: 0.72), Color(red: 0.88, green: 0.32, blue: 0.55)]
        }
        return [Color(red: 0.38, green: 0.62, blue: 1.0), Color(red: 0.55, green: 0.38, blue: 0.95)]
    }
}

// MARK: - ChildCardView (same struct, styled)
struct ChildCardView: View {
    var child: Child

    var body: some View {
        HStack(spacing: 15) {

            // Avatar / placeholder (original Circle, now gradient)
            Circle()
                .fill(
                    LinearGradient(
                        colors: child.name.avatarGradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 60, height: 60)
                .shadow(color: child.name.avatarGradient.first?.opacity(0.35) ?? .clear,
                        radius: 10, x: 0, y: 5)
                .overlay(
                    Text(String(child.name.prefix(1)))
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                )

            // Original VStack content
            VStack(alignment: .leading, spacing: 6) {
                Text(child.name)
                    .font(.system(size: 17, weight: .bold, design: .rounded))
                    .foregroundColor(Color(red: 0.18, green: 0.14, blue: 0.30))

                HStack(spacing: 6) {
                    Text("💤")
                    Text(child.napTime)
                        .font(.system(size: 13, design: .rounded))
                        .foregroundColor(Color(red: 0.45, green: 0.38, blue: 0.62))
                    Spacer()
                }

                HStack(spacing: 6) {
                    Text("🍎")
                    Text(child.meal)
                        .font(.system(size: 13, design: .rounded))
                        .foregroundColor(Color(red: 0.28, green: 0.52, blue: 0.38))
                    Spacer()
                }

                HStack(spacing: 6) {
                    Circle()
                        .fill(child.mood.moodAccent)
                        .frame(width: 8, height: 8)
                    Text(child.mood)
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(Color(red: 0.35, green: 0.28, blue: 0.50))
                    Spacer()
                }
            }
            .padding(.vertical, 4)

            // Tap indicator
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

// MARK: - ParentDashboard (same struct, styled)
struct ParentDashboard: View {
    // Sample data: multiple children (unchanged)
    let children = [
        Child(name: "Alice", napTime: "10:00 - 11:00", meal: "Breakfast - 80% eaten", mood: "Happy 😊"),
        Child(name: "Bob",   napTime: "11:00 - 12:00", meal: "Lunch - 70% eaten",     mood: "Excited 😄")
    ]

    var body: some View {
        ZStack {
            // ── Background (replaces original LinearGradient) ──────
            Color(red: 0.97, green: 0.95, blue: 0.99)
                .ignoresSafeArea()

            // Blobs
            Ellipse()
                .fill(Color(red: 1.0, green: 0.78, blue: 0.88).opacity(0.48))
                .frame(width: 340, height: 270)
                .blur(radius: 110)
                .offset(x: -130, y: -290)
                .allowsHitTesting(false)

            Ellipse()
                .fill(Color(red: 0.68, green: 0.80, blue: 1.0).opacity(0.38))
                .frame(width: 300, height: 240)
                .blur(radius: 100)
                .offset(x: 140, y: 220)
                .allowsHitTesting(false)

            Ellipse()
                .fill(Color(red: 0.80, green: 0.68, blue: 1.0).opacity(0.28))
                .frame(width: 200, height: 160)
                .blur(radius: 80)
                .offset(x: 80, y: -120)
                .allowsHitTesting(false)

            // ── Main layout (mirrors original VStack spacing: 20) ──
            VStack(spacing: 20) {

                // Top greeting (original VStack, styled)
                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: 12) {
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
                                .frame(width: 52, height: 52)
                                .shadow(color: Color(red: 0.88, green: 0.42, blue: 0.72).opacity(0.30),
                                        radius: 12, x: 0, y: 6)
                            Text("👪")
                                .font(.system(size: 24))
                        }

                        VStack(alignment: .leading, spacing: 3) {
                            Text("Welcome, Parent!")
                                .font(.system(size: 26, weight: .heavy, design: .rounded))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [Color(red: 0.50, green: 0.18, blue: 0.68),
                                                 Color(red: 0.92, green: 0.30, blue: 0.52)],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )

                            Text("Your children's daily summary")
                                .font(.system(size: 13, weight: .medium, design: .rounded))
                                .foregroundColor(Color(red: 0.55, green: 0.46, blue: 0.65))
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 8)

                // Section label
                HStack {
                    Rectangle()
                        .fill(Color(red: 0.75, green: 0.65, blue: 0.90).opacity(0.38))
                        .frame(height: 1)
                    Text("CHILDREN")
                        .font(.system(size: 10, weight: .semibold, design: .rounded))
                        .foregroundColor(Color(red: 0.58, green: 0.46, blue: 0.72))
                        .tracking(2.2)
                        .fixedSize()
                    Rectangle()
                        .fill(Color(red: 0.75, green: 0.65, blue: 0.90).opacity(0.38))
                        .frame(height: 1)
                }
                .padding(.horizontal, 24)

                // Scrollable cards (original ScrollView + LazyVStack + ForEach unchanged)
                ScrollView {
                    LazyVStack(spacing: 14) {
                        ForEach(children) { child in
                            NavigationLink(destination: ChildDetailView(
                                childName: child.name,
                                napTime: child.napTime,
                                mealInfo: child.meal,
                                mood: child.mood
                            )) {
                                ChildCardView(child: child)
                                    .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.bottom, 16)
                }

                Spacer()

                // Footer
                HStack(spacing: 6) {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 11))
                        .foregroundColor(Color(red: 0.95, green: 0.45, blue: 0.60))
                    Text("Staying close to every milestone")
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(Color(red: 0.62, green: 0.52, blue: 0.72))
                }
                .padding(.bottom, 24)
            }
        }
        .navigationTitle("Parent Dashboard")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ParentDashboard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ParentDashboard()
        }
    }
}
