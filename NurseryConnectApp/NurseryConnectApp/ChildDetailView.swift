//
//  ChildDetailView.swift
//  NurseryConnectApp
//
//  Created by Nimesha Jayawickrama on 2026-03-30.
//

import SwiftUI

// MARK: - Mood Helper
private extension String {
    var moodColor: Color {
        if self.lowercased().contains("happy") { return Color(red: 1.0, green: 0.80, blue: 0.20) }
        if self.lowercased().contains("sad")   { return Color(red: 0.45, green: 0.65, blue: 0.95) }
        if self.lowercased().contains("tired") { return Color(red: 0.75, green: 0.65, blue: 0.95) }
        if self.lowercased().contains("angry") { return Color(red: 0.95, green: 0.45, blue: 0.40) }
        return Color(red: 0.55, green: 0.85, blue: 0.70)
    }
}

// MARK: - Info Card Component
private struct InfoCard: View {
    let icon: String
    let label: String
    let value: String
    let accent: Color
    

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(accent.opacity(0.18))
                    .frame(width: 44, height: 44)
                Text(icon)
                    .font(.system(size: 20))
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(label.uppercased())
                    .font(.system(size: 10, weight: .semibold, design: .rounded))
                    .foregroundColor(.secondary)
                    .tracking(1.2)
                Text(value)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(.primary)
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(.systemBackground))
                .shadow(color: accent.opacity(0.12), radius: 8, x: 0, y: 4)
        )
    }
}

// MARK: - Main View (same interface as original)
struct ChildDetailView: View {
    @Environment(\.dismiss) var dismiss
    var childName: String
    var napTime: String
    var mealInfo: String
    var mood: String
    var hideBackButton: Bool = false

    // Derived initials for avatar
    private var initials: String {
        childName
            .split(separator: " ")
            .prefix(2)
            .compactMap { $0.first.map(String.init) }
            .joined()
            .uppercased()
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {

                // ── Hero / Avatar Header ──────────────────────────────
                ZStack(alignment: .bottom) {
                    // Soft gradient blob background
                    RoundedRectangle(cornerRadius: 32, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(red: 1.0, green: 0.88, blue: 0.78),
                                    Color(red: 0.95, green: 0.78, blue: 0.90)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(maxWidth: .infinity)
                        .frame(height: 220)
                        .padding(.horizontal, -16)

                    VStack(spacing: 10) {
                        // Avatar circle
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [Color(red: 1.0, green: 0.72, blue: 0.55),
                                                 Color(red: 0.98, green: 0.55, blue: 0.72)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 90, height: 90)
                                .shadow(color: .pink.opacity(0.30), radius: 12, x: 0, y: 6)

                            Text(initials.isEmpty ? "👶" : initials)
                                .font(.system(size: initials.isEmpty ? 36 : 32,
                                              weight: .bold,
                                              design: .rounded))
                                .foregroundColor(.white)
                        }

                        // Name
                        Text(childName)
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundColor(Color(red: 0.25, green: 0.18, blue: 0.22))

                        // Mood badge
                        HStack(spacing: 4) {
                            Circle()
                                .fill(mood.moodColor)
                                .frame(width: 8, height: 8)
                            Text(mood)
                                .font(.system(size: 13, weight: .medium, design: .rounded))
                                .foregroundColor(Color(red: 0.35, green: 0.28, blue: 0.32))
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .fill(mood.moodColor.opacity(0.18))
                        )
                        .padding(.bottom, 20)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)

                // ── Info Cards ────────────────────────────────────────
                VStack(spacing: 12) {
                    InfoCard(
                        icon: "🌙",
                        label: "Nap Time",
                        value: napTime,
                        accent: Color(red: 0.55, green: 0.45, blue: 0.90)
                    )
                    InfoCard(
                        icon: "🍽️",
                        label: "Meal",
                        value: mealInfo,
                        accent: Color(red: 0.25, green: 0.75, blue: 0.55)
                    )
                    InfoCard(
                        icon: "💛",
                        label: "Mood",
                        value: mood,
                        accent: mood.moodColor
                    )
                }
                .padding(.top, 24)
                .padding(.horizontal, 16)

                Spacer(minLength: 40)
            }
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle(childName)
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

// MARK: - Preview (unchanged)
struct ChildDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChildDetailView(
                childName: "Alice",
                napTime: "10:00–11:00",
                mealInfo: "Breakfast – 80% eaten",
                mood: "Happy 😊"
            )
        }
    }
}
