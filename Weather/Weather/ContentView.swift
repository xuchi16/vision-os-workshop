//
//  ContentView.swift
//  Weather
//
//  Created by xuchi on 2023/12/22.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    @StateObject var weatherClient = WeatherClient()
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Model3D(named: "Scene", bundle: realityKitContentBundle)
                        .padding(.bottom, 20)

                    Text("Shanghai")
                    Text("10°C")
                        .font(.title)
                    Text("Sunny")
                        .font(.subheadline)
                    
                }
                .padding(20)
                .background(.thickMaterial)
                .shadow(radius: 5)
                .cornerRadius(20)
                
                VStack {
                    Model3D(named: "Scene", bundle: realityKitContentBundle)
                        .padding(.bottom, 20)

                    Text("Shanghai")
                    Text("10°C")
                        .font(.title)
                    Text("Sunny")
                        .font(.subheadline)
                    
                }
                .padding(20)
                .background(.thickMaterial)
                .shadow(radius: 5)
                .cornerRadius(20)
            }

            
            HStack {
                VStack {
                    Model3D(named: "Scene", bundle: realityKitContentBundle)
                        .padding(.bottom, 20)

                    Text("Shanghai")
                    Text("10°C")
                        .font(.title)
                    Text("Sunny")
                        .font(.subheadline)
                    
                }
                .padding(20)
                .background(.thickMaterial)
                .shadow(radius: 5)
                .cornerRadius(20)
                
                VStack {
                    Model3D(named: "Scene", bundle: realityKitContentBundle)
                        .padding(.bottom, 20)

                    Text("Shanghai")
                    Text("10°C")
                        .font(.title)
                    Text("Sunny")
                        .font(.subheadline)
                    
                }
                .padding(20)
                .background(.thickMaterial)
                .shadow(radius: 5)
                .cornerRadius(20)
            }

                        if let weather = weatherClient.realtimeWeather {
                            Text("Shanghai")
                            Text("\(weather.current.tempC)°C")
                                .font(.title)
                            Text(weather.current.condition.text)
                                .font(.subheadline)
                        } else {
                            Text("Loading weather...")
                        }
            
        }

        //        .onAppear {
        //            weatherClient.getRealtimeWeather()
        //        }
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
