//
//  ImageDetailView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-04-14.
//

import SwiftUI

struct ImageDetailView: View {
    
    var item: (url: String, title: String)
    
    var body: some View {
        VStack(spacing: 20) {
            
            AsyncImage(url: URL(string: item.url)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .cornerRadius(16)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(item.title)
                    .font(.title2)
                    .bold()
                
                Text("This activity shows children engaging in daily nursery tasks. Helps monitor mood, meals, and participation.")
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(16)
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .navigationTitle("Details")
    }
}
