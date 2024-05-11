//
//  HomeView.swift
//  WeatherApp
//
//  Created by Ivan Morgun on 02.05.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var locationManager = LocationManager()
    @State var weatherResponse: ResponseBody?
    
    var weatherManager = WeatherManager()
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weatherResponse {
                    WeatherView(weather: weather)
                } else {
                    ProgressView()
                        .task {
                            do {
                                weatherResponse = try await weatherManager.getCurrent(lat: location.latitude, lng: location.longitude)
                            } catch {
                                print("Error: ", error.localizedDescription)
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    ProgressView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [Color("yellow1"), Color("yellow2")], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    HomeView()
}
