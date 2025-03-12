//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Abiodun Osagie on 04/03/2025.
//

import SwiftUI

struct ExternalWeblinkView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    // MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link)
                    ?? URL(string: "https://wikipedia.org")!))
                }
                .foregroundColor(.accentColor)
            }//: HSTACK
        }//: BOX
    }
}


// MARK: - PREVIEW
#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    ExternalWeblinkView(animal: animals[1])
        .previewLayout(.sizeThatFits)
        .padding()
}
