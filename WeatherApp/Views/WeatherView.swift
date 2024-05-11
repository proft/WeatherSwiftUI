//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Ivan Morgun on 02.05.2024.
//

import SwiftUI
import MapKit

struct WeatherView: View {
    var weather: ResponseBody
    
    @State private var showingMapSheet = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button(action: {
                showingMapSheet.toggle()
            }, label: {
                Text(weather.name)
                    .font(.system(size: 36, weight: .semibold))
                    .foregroundStyle(.black)
            })
            .sheet(isPresented: $showingMapSheet) {
                MapView(title: weather.name, center: CLLocationCoordinate2D(latitude: weather.coord.lat, longitude: weather.coord.lon))
            }
            
            Text(Date.now, style: .date)
                .font(.system(size: 20))
                .opacity(0.5)
            
            HStack {
                if let img = weather.icon {
                    AsyncImage(url: URL(string: img)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 100)
                            .frame(width: 200, height: 200)
                    }
                }
                
                VStack {
                    Text(weather.main.feels_like.roundDouble() + " °")
                        .font(.system(size: 62, weight: .semibold))
                    
                    Text(weather.weather[0].main)
                        .font(.system(size: 26))
                }
                
                Spacer()
            }
            .padding()
            
            Spacer()
            CardView(icon: "thermometer", text: "Min temp", value: weather.main.temp_min.roundDouble() + " °")
            CardView(icon: "thermometer", text: "Max temp", value: weather.main.temp_max.roundDouble() + " °")
            CardView(icon: "wind", text: "Wind speed", value: weather.wind.speed.roundDouble() + " m/s")
            CardView(icon: "humidity", text: "Humidity", value: weather.main.humidity.roundDouble())
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [Color("yellow1"), Color("yellow2")], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}
