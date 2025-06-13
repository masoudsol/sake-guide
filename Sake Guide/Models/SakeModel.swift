//
//  Story.swift
//  Sake Guide
//
//  Created by Masoud Soleimani on 2025-03-17.
//

import SwiftUI

struct SakeModel: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let description: String?
    let picture: String?
    let rating: Double?
    let address: String?
    let coordinates: [Double]?
    let google_maps_link: String?
    let website: String?
}
