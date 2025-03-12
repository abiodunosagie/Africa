//
//  ContentView.swift
//  Africa
//
//  Created by Abiodun Osagie on 15/02/2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive: Bool = false
    
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Group {
                
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(
                                destination: AnimalDetailView(animal: animal)) {
                                    AnimalListItemView(animal: animal)
                                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                }//: LINK
                        }//: LOOP
                    }//: LIST
                } else {
                    Text("Grid view is active")
                }//: CONDITION
            }//: GROUP
            .listStyle(PlainListStyle())
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // LIST
                        Button {
                            print("List view  is activated!")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(
                                    isGridViewActive ? .primary : .accentColor
                                )
                        }
                        
                        // GRID
                        Button{
                            print("Grid view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                        }label: {
                            Image(systemName: "square.grid.2x2")
                                .font(.title2)
                                .foregroundColor(
                                    isGridViewActive ? .accentColor : .primary
                                )
                        }
                    }//: HSTACK
                }
            }
        } //: NAVIGATION
       
    }
}


// MARK: PREVIEW
#Preview {
    ContentView()
}
