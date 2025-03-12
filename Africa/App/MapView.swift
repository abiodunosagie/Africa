//
//  MapView.swift
//  Africa
//
//  Created by Abiodun Osagie on 15/02/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES

    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(
            latitudeDelta: 70.0,
            longitudeDelta: 70.0
        )
        var mapRegion = MKCoordinateRegion(
            center: mapCoordinates,
            span: mapZoomLevel
        )
        
        return mapRegion
    } ()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - BODY
    var body: some View {
        // MARK: - NO 1 BASIC MAP
       // Map(coordinateRegion: $region)
        // MARK: - ADVANCED MAP
        Map(
            coordinateRegion: $region,
            annotationItems: locations) { item in
                // (A) PIN: OLD STYLE (ALWAYS STATIC)
              //  MapPin(coordinate: item.location, tint: .accentColor)
                // (B) MARK: - NEW STYLE (always static)
              //  MapMarker(coordinate: item.location, tint: .accentColor)
                // MARK: - CUSTOM BASIC ANNOTATION (it could be interactive)
//                MapAnnotation(coordinate: item.location) {
//                    Image("logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 32, height: 32, alignment: .center)
//                } //: ANNOTATION
                // (D) CUSTOM ADVANCED ANNOTATION (it could be interactive)
                MapAnnotation(coordinate: item.location) {
                    MapAnnotationView(location: item)
                }
                
            } //: MAP
            .overlay(HStack(alignment: .center, spacing: 12){
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3){
                    HStack{ Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack{ Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }//: HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(.ultraThinMaterial)
                .cornerRadius(8)
                .padding()
                     ,alignment: .top
            
            )
    }
}


// MARK: - PREVIEW
#Preview {
    MapView()
}
