//
//  SakeDetailView.swift
//  Sake Guide
//
//  Created by Masoud Soleimani on 2025-06-12.
//

import SwiftUI
import MapKit

struct SakeDetailView: View {
    let location: SakeModel
    @State private var isBookmarked = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let image = location.picture, let url = URL(string: image) {
                    AsyncImageView(
                        url: url,
                        contentMode: .fill,
                        width: nil,
                        height: 200,
                        cornerRadius: 12
                    )
                }

                HStack {
                    Text(location.name)
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    Button(action: {
                        isBookmarked.toggle()
                    }) {
                        Image(systemName: isBookmarked ? "heart.fill" : "heart")
                            .foregroundColor(isBookmarked ? .red : .gray)
                            .font(.title2)
                    }
                }

                if let description = location.description {
                    Text(description)
                        .font(.body)
                        .foregroundColor(.secondary)
                }

                if let rating = location.rating {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("Rating: \(rating, specifier: "%.1f")")
                    }
                    .font(.subheadline)
                }

                if let address = location.address {
                    HStack {
                        Image(systemName: "location.fill")
                        Text(address)
                    }
                    .font(.subheadline)
                }

                if let coordinates = location.coordinates, coordinates.count == 2 {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Map Location")
                            .font(.headline)
                        MapView(coordinate: CLLocationCoordinate2D(latitude: coordinates[0], longitude: coordinates[1]))
                            .frame(height: 200)
                            .cornerRadius(12)
                    }
                }

                if let website = location.website, let url = URL(string: website) {
                    Link(destination: url) {
                        Label("Visit Website", systemImage: "safari")
                    }
                    .font(.subheadline)
                }

                if let mapLink = location.google_maps_link, let url = URL(string: mapLink) {
                    Link(destination: url) {
                        Label("Open in Google Maps", systemImage: "map.fill")
                    }
                    .font(.subheadline)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SakeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SakeDetailView(location: SakeModel(name: "", description: "", picture: "", rating: 0.0, address: "", coordinates: nil, google_maps_link: "", website: ""))
    }
}
