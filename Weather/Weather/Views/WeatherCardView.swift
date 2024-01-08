//
//  WeatherCardView.swift
//  Weather
//
//  Created by xuchi on 2024/1/5.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct WeatherCardView: View {
    var body: some View {
        VStack {
//            Model3D(named: "Sun", bundle: realityKitContentBundle)
//                .padding(.bottom, 20)
            
            Text("Shanghai")
            Text("10°C")
                .font(.title)
            Text("Sunny")
                .font(.subheadline)
            
        }
        .padding(20)
        .shadow(radius: 5)
        .cornerRadius(20)
    }
    //        .onAppear {
    //            weatherClient.getRealtimeWeather()
    //        }
}

#Preview {
    WeatherCardView()
}
