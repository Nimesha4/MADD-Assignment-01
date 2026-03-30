//
//  ContentView.swift
//  NurseryConnectApp
//
//  Created by Nimesha Jayawickrama on 2026-03-30.
//

//
//  ContentView.swift
//  NurseryConnectApp
//
//  Created by Nimesha Jayawickrama on 2026-03-30.
//

import SwiftUI

// MARK: - Role Card
private struct RoleCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let gradient: [Color]
    let action: () -> Void

    @State private var isPressed = false

    var body: some View {
        Button(action: action) {
            HStack(spacing: 18) {
                // Icon bubble
                ZStack {
                    Circle()
                        .fill(.white.opacity(0.25))
                        .frame(width: 58, height: 58)
                    Text(icon)
                        .font(.system(size: 28))
                }

                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    Text(subtitle)
                        .font(.system(size: 13, weight: .regular, design: .rounded))
                        .foregroundColor(.white.opacity(0.80))
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white.opacity(0.70))
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
            .background(
                LinearGradient(colors: gradient,
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            )
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
            .shadow(color: gradient.first?.opacity(0.40) ?? .clear, radius: 14, x: 0, y: 8)
            .scaleEffect(isPressed ? 0.97 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded   { _ in isPressed = false }
        )
    }
}

// MARK: - Floating Blob (decorative)
private struct Blob: View {
    let color: Color
    let size: CGFloat
    let offset: CGSize

    var body: some View {
        Ellipse()
            .fill(color)
            .frame(width: size, height: size * 0.85)
            .blur(radius: size * 0.38)
            .offset(offset)
            .allowsHitTesting(false)
    }
}

// MARK: - Content View
struct ContentView: View {
    @State private var selectedRole: String? = nil
    @State private var appeared = false

    var body: some View {
        NavigationView {
            ZStack {
                // ── Background ─────────────────────────────────────
                Color(red: 0.97, green: 0.95, blue: 0.98)
                    .ignoresSafeArea()

                // Soft blobs
                Blob(color: Color(red: 1.0, green: 0.80, blue: 0.85).opacity(0.55),
                     size: 320,
                     offset: CGSize(width: -120, height: -260))
                Blob(color: Color(red: 0.75, green: 0.82, blue: 1.0).opacity(0.50),
                     size: 280,
                     offset: CGSize(width: 130, height: 180))
                Blob(color: Color(red: 1.0, green: 0.92, blue: 0.70).opacity(0.40),
                     size: 200,
                     offset: CGSize(width: 90, height: -320))

                // ── Content ────────────────────────────────────────
                VStack(spacing: 0) {

                    Spacer()

                    // Logo + wordmark
                    VStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [Color(red: 1.0, green: 0.60, blue: 0.72),
                                                 Color(red: 0.78, green: 0.55, blue: 0.98)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 88, height: 88)
                                .shadow(color: Color(red: 0.90, green: 0.50, blue: 0.75).opacity(0.40),
                                        radius: 20, x: 0, y: 10)
                            Text("🌱")
                                .font(.system(size: 42))
                        }
                        .scaleEffect(appeared ? 1.0 : 0.6)
                        .opacity(appeared ? 1.0 : 0.0)

                        Text("NurseryConnect")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [Color(red: 0.55, green: 0.22, blue: 0.65),
                                             Color(red: 0.92, green: 0.35, blue: 0.55)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .opacity(appeared ? 1.0 : 0.0)
                            .offset(y: appeared ? 0 : 10)

                        Text("Connecting families & carers")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundColor(Color(red: 0.55, green: 0.45, blue: 0.60))
                            .opacity(appeared ? 1.0 : 0.0)
                    }

                    Spacer().frame(height: 52)

                    // Section label
                    HStack {
                        Text("I AM A…")
                            .font(.system(size: 11, weight: .semibold, design: .rounded))
                            .foregroundColor(Color(red: 0.60, green: 0.50, blue: 0.65))
                            .tracking(2)
                        Spacer()
                    }
                    .padding(.horizontal, 28)
                    .opacity(appeared ? 1.0 : 0.0)
                    .padding(.bottom, 14)

                    // Role cards
                    VStack(spacing: 14) {
                        RoleCard(
                            icon: "👨‍👩‍👧",
                            title: "Parent",
                            subtitle: "View updates & track your child",
                            gradient: [Color(red: 1.0, green: 0.55, blue: 0.72),
                                       Color(red: 0.95, green: 0.38, blue: 0.55)],
                            action: { selectedRole = "Parent" }
                        )

                        RoleCard(
                            icon: "🧑‍🏫",
                            title: "Keyworker",
                            subtitle: "Manage children & log activities",
                            gradient: [Color(red: 0.45, green: 0.65, blue: 1.0),
                                       Color(red: 0.38, green: 0.48, blue: 0.95)],
                            action: { selectedRole = "Keyworker" }
                        )
                    }
                    .padding(.horizontal, 24)
                    .opacity(appeared ? 1.0 : 0.0)
                    .offset(y: appeared ? 0 : 24)

                    Spacer()

                    // Footer
                    Text("Safe · Trusted · Connected")
                        .font(.system(size: 12, design: .rounded))
                        .foregroundColor(Color(red: 0.68, green: 0.60, blue: 0.72))
                        .padding(.bottom, 32)
                        .opacity(appeared ? 1.0 : 0.0)
                }

                // ── Hidden NavigationLinks (unchanged logic) ───────
                NavigationLink(
                    destination: ParentDashboard(),
                    tag: "Parent",
                    selection: $selectedRole
                ) { EmptyView() }

                NavigationLink(
                    destination: KeyworkerRoleView(),
                    tag: "Keyworker",
                    selection: $selectedRole
                ) { EmptyView() }
            }
            .navigationBarHidden(true)
            .onAppear {
                withAnimation(.spring(response: 0.7, dampingFraction: 0.75).delay(0.15)) {
                    appeared = true
                }
            }
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
