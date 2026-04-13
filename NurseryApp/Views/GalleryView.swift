//
//  GalleryView.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-04-14.
//

import SwiftUI

struct GalleryView: View {
    
    let items: [(url: String, title: String)] = [
        ("https://images.unsplash.com/photo-1516627145497-ae6968895b74?w=500", "Learning Time"),
        ("https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?w=500", "Group Fun"),
        ("https://images.unsplash.com/photo-1503919545889-aef636e10ad4?w=500", "Exploration"),
        ("https://images.unsplash.com/photo-1503457574462-bd27054394c1?w=500", "Outdoor Activity"),
        ("https://images.unsplash.com/photo-1529070538774-1843cb3265df?w=500", "Drawing Time"),
        ("https://images.unsplash.com/photo-1516321497487-e288fb19713f?w=500", "Play Session")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                
                VStack(spacing: 14) {
                    
                    // GRID
                    LazyVGrid(columns: columns, spacing: 12) {
                        
                        ForEach(items.indices, id: \.self) { index in
                            let item = items[index]
                            
                            NavigationLink(destination: ImageDetailView(item: item)) {
                                
                                VStack(spacing: 0) {
                                    
                                    AsyncImage(url: URL(string: item.url)) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        Color(.systemGray5)
                                    }
                                    .frame(height: 110)
                                    .frame(maxWidth: .infinity)
                                    .clipped()
                                    
                                    Text(item.title)
                                        .font(.caption)
                                        .lineLimit(1)
                                        .foregroundColor(.primary)
                                        .padding(6)
                                }
                                .background(Color(.systemBackground))
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.05), radius: 3)
                            }
                        }
                    }
                    
                    //  BOTTOM FEATURE IMAGE 
                    NavigationLink(destination: ImageDetailView(item: (
                        url: "https://images.unsplash.com/photo-1509062522246-3755977927d7?w=800",
                        title: "Kids Creative Activity"
                    ))) {
                        
                        AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1509062522246-3755977927d7?w=800")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color(.systemGray5)
                        }
                        .frame(height: 130)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .cornerRadius(14)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.top, 10)
            }
            .background(Color(.systemGray6))
            .navigationTitle("Gallery")
        }
    }
}
