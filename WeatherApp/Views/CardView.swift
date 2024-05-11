//
//  CardView.swift
//  WeatherApp
//
//  Created by Ivan Morgun on 02.05.2024.
//

import SwiftUI

struct CardView: View {
    var icon: String
    var text: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .imageScale(.large)
                .padding()
                .frame(width: 50, height: 50)
                .background(.white.opacity(0.7))
                .cornerRadius(12)
            
            Text(text)
                .font(.system(size: 16))
            
            Spacer()
            
            Text(value)
                .font(.headline)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .background(.white.opacity(0.3))
        .cornerRadius(12)
    }
}
