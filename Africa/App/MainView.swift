//
//  MainView.swift
//  Africa
//
//  Created by Abiodun Osagie on 15/02/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2X2")
                    Text("Browse")
                }
        }
    }
}

#Preview {
    MainView()
}
