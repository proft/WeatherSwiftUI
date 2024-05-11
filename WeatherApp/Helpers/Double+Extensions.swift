//
//  Double+Extensions.swift
//  WeatherApp
//
//  Created by Ivan Morgun on 02.05.2024.
//

import Foundation

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}
