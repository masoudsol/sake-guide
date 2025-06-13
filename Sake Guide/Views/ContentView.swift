//
//  ContentView.swift
//  Sake Guide
//
//  Created by Masoud Soleimani on 2025-03-17.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SakeViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.locations) { location in
                NavigationLink(destination: SakeDetailView(location: location)) {
                    StoryRow(location: location)
                }
            }
            .navigationTitle("Sake Shops")
            .onAppear {
                viewModel.fetchStories()
            }
        }
    }
}

struct StoryRow: View {
    let location: SakeModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(location.name)
                    .font(.headline)
                
                if let address = location.address {
                    HStack() {
                        Image(systemName: "location")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Text(address)
                            .font(.subheadline)
                    }
                }
                if let rating = location.rating {
                    HStack() {
                        Image(systemName: "star")
                            .foregroundColor(.blue)
                        Text("\(rating, specifier: "%.1f")")
                            .font(.subheadline)
                            .foregroundColor(rating >= 4.5 ? .green : rating >= 4.2 ? .yellow : .red)
                    }
                }
            }
            Spacer()
            if let image = location.picture, let imageUrl = URL(string: image) {
                AsyncImageView(url: imageUrl)
            }
        }
        .padding(5)
    }
}

// I am targeting iOS 14, using my own custom AsyncIamgeView. AsyncIamge is only available on iOS 15+
struct AsyncImageView: View {
    let url: URL?
    var contentMode: ContentMode = .fill
    var width: CGFloat? = 80
    var height: CGFloat? = 60
    var cornerRadius: CGFloat = 8

    @State private var image: UIImage?
    @State private var inProgress = false

    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
            } else if (!inProgress) {
                ProgressView()
                    .onAppear(perform: loadImage)
            }
        }
        .frame(width: width, height: height)
        .clipped()
        .cornerRadius(cornerRadius)
    }

    private func loadImage() {
        guard let url = url,let data = try? Data(contentsOf: url),
              let uiImage = UIImage(data: data) else {
            inProgress = true
            image = nil
            return
        }

        DispatchQueue.main.async {
            image = uiImage
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
