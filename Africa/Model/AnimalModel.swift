//
//  AnimalModel.swift
//  Africa
//
//  Created by Abiodun Osagie on 24/02/2025.
//

import SwiftUI

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let link: String
    let image: String
    let headline: String
    let gallery: [String]
    let fact: [String]
}
