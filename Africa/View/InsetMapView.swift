//
//  InsetMapView.swift
//  Africa
//
//  Created by Abiodun Osagie on 25/02/2025.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    // MARK: - PROPERTIES
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599),
        span: MKCoordinateSpan(latitudeDelta: 60.0,longitudeDelta: 60.0))
    
    // MARK: - BODY
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(NavigationLink(destination: MapView()) {
                HStack {
                    Image(systemName: "mappin.circle")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    
                    Text("Locations")
                        .foregroundColor(.accentColor)
                        .fontWeight(.bold)
                } //: HSTACK
                .padding(.vertical, 10)
                .padding(.horizontal, 14)
                .background(Color.black.opacity(0.4)
                    .cornerRadius(8))
            } //: NAVIGATION
                .padding(12)
                     , alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}



// MARK: - PREVIEWS
#Preview {
    InsetMapView()
        .previewLayout(.sizeThatFits)
        .padding()
}
