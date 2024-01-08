//
//  WeatherService.swift
//  Weather
//
//  Created by xuchi on 2023/12/25.
//

import Foundation

protocol WeatherService {
    func getRealtimeWeather(completion: @escaping (RealtimeWeather?, String?) -> Void)
}

class MockWeatherService: WeatherService {
    func getRealtimeWeather(completion: @escaping (RealtimeWeather?, String?) -> Void) {
        guard let path = Bundle.main.path(forResource: "ShanghaiWeather", ofType: "json") else {
            print("Cannot find")
            completion(nil, "Cannot find the json file")
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let mockWeather = try JSONDecoder().decode(RealtimeWeather.self, from: data)
            completion(mockWeather, nil)
        } catch{
            completion(nil, "Error occurs when reading or parsing: \(error)")
        }
    }
}

class RealWeatherService: WeatherService {
    func getRealtimeWeather(completion: @escaping (RealtimeWeather?, String?) -> Void) {
        // ...
    }
    
}
