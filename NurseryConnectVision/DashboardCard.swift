//
//  DashboardCard.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-06-01.
//

import SwiftUI

struct DashboardCard: View {

    let title: String
    let value: String
    let icon: String

    var body: some View {

        VStack(spacing: 12) {

            Image(systemName: icon)
                .font(.system(size: 36))
                .foregroundStyle(.orange)

            Text(value)
                .font(.system(size: 28))
                .fontWeight(.bold)

            Text(title)
                .font(.headline)
        }
        .frame(width: 280, height: 180)
        .glassBackgroundEffect()
    }
}
