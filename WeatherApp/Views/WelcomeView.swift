//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Ivan Morgun on 02.05.2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the Weather App")
                    .font(.title)
                    .bold()
                
                Text("Please share your current location")
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal, 32)
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .foregroundColor(.white)
            .cornerRadius(30)
        }
    }
}

#Preview {
    ContentView()
}
