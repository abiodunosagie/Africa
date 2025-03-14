//
//  VideoModel.swift
//  Africa
//
//  Created by Abiodun Osagie on 04/03/2025.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
