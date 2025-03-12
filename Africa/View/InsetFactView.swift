//
//  InsetFactView.swift
//  Africa
//
//  Created by Abiodun Osagie on 24/02/2025.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    // MARK: - BODY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }//: TABVIEW
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//: BOX
    }
}

// MARK: - PREVIEW
#Preview {
    let animals: [Animal] =
    Bundle.main.decode("animals.json")
    InsetFactView(animal: animals[0])
        .previewLayout(.sizeThatFits)
        .padding()
}
