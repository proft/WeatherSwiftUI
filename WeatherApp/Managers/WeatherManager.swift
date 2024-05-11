//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Ivan Morgun on 02.05.2024.
//

import Foundation
import CoreLocation

struct ResponseBody: Decodable {
    var coord: CoordinateResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    
    struct CoordinateResponse: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
    
    var icon: String? {
        // https://openweathermap.org/weather-conditions
        guard weather.count > 0 else { return nil }
        let name = weather[0].icon
        return "https://openweathermap.org/img/wn/\(name)@2x.png"
    }
}

class WeatherManager {
    let apiKey = "***"
    
    func getCurrent(lat: CLLocationDegrees, lng: CLLocationDegrees) async throws -> ResponseBody?  {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lng)&appid=\(apiKey)&units=metric") else { return nil }
        
        print(url)
        
        let req = URLRequest(url: url)
        let (data, res) = try await URLSession.shared.data(for: req)
        
        guard (res as? HTTPURLResponse)?.statusCode == 200 else { return nil }
        
        let obj = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return obj
    }
}
