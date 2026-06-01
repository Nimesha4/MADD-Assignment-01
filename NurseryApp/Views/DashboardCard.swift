//
//  DashboardCard.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-05-31.
//

import SwiftUI

struct DashboardCard: View {

    let title: String
    let value: String
    let icon: String

    var body: some View {

        VStack(spacing: 12) {

            Image(systemName: icon)
                .font(.title)

            Text(value)
                .font(.title2)
                .bold()

            Text(title)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.regularMaterial)
        .cornerRadius(16)
        .shadow(radius: 3)
    }
}

