//
//  StoryViewModel.swift
//  Sake Guide
//
//  Created by Masoud Soleimani on 2025-03-17.
//

import SwiftUI

class SakeViewModel: ObservableObject {
    @Published var locations: [SakeModel] = []
    
    func fetchStories() {
        if let url = Bundle.main.url(forResource: "Sake", withExtension: "json") {
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
}
