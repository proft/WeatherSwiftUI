//
//  MapView.swift
//  WeatherApp
//
//  Created by Ivan Morgun on 10.05.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(\.dismiss) var dismiss
    var title: String
    var center: CLLocationCoordinate2D
    var position: MapCameraPosition
    
    init(title: String, center: CLLocationCoordinate2D) {
        self.title = title
        self.center = center
        self.position =  MapCameraPosition.region(
            MKCoordinateRegion(
                center: center,
                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
            )
        )
    }
    
    var body: some View {
        VStack {
            Button("Hide") {
                dismiss()
            }
            .padding()
            
            Map(initialPosition: position) {
                Marker(title, coordinate: center).tint(.green)
            }
        }
    }
}
