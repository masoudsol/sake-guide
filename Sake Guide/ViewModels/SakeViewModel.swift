//
//  StoryViewModel.swift
//  Sake Guide
//
//  Created by Masoud Soleimani on 2025-03-17.
//

import SwiftUI

class SakeViewModel: ObservableObject {
    @Published var locations: [SakeModel] = []
    
    func fetchStories(from data: Data? = nil) {
        if let data = data {
            parseData(data)
        } else if let url = Bundle.main.url(forResource: "Sake", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([SakeModel].self, from: data)
                self.locations = jsonData
            } catch {
                print("error:\(error)")
            }
        }
    }
    
    private func parseData(_ data: Data) {
        let decoder = JSONDecoder()
        if let decoded = try? decoder.decode([SakeModel].self, from: data) {
            DispatchQueue.main.async {
                self.locations = decoded
            }
        }
    }
}
