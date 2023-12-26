//
//  WeatherClient.swift
//  Weather
//
//  Created by xuchi on 2023/12/22.
//

import Foundation

class WeatherClient: ObservableObject {
    // Use @Published to mark the properties to observe
    @Published var realtimeWeather: RealtimeWeather?
    @Published var errorMessage: String?

    // getRealtimeWeather method to fetch weather data from the API
    func getRealtimeWeather() {
        // Ensure the URL is valid
        guard let url = URL(string: "https://weatherapi-com.p.rapidapi.com/current.json?q=shanghai") else {
            DispatchQueue.main.async {
                self.errorMessage = "Invalid URL"
            }
            return
        }
        
        // Create URLRequest and set headers if needed
        var request = URLRequest(url: url)
        // Add API key or other required header information here
        request.setValue("17d1afe6efmsh91ce94b0d9932c4p1ab1bbjsn9d193ebd5502", forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("weatherapi-com.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        // Create a data task and handle the response
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            // Error handling
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Request error: \(error.localizedDescription)"
                }
                return
            }
            
            // Ensure the response is an HTTPURLResponse
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    self.errorMessage = "Invalid response"
                }
                return
            }
                        
            // Check the status code
            if httpResponse.statusCode == 200 {
                guard let data = data else {
                    DispatchQueue.main.async {
                        self.errorMessage = "No data returned"
                    }
                    return
                }
                
                // Try to decode the data
                do {
                    // Convert data to a string
                    let rawString = String(data: data, encoding: .utf8) ?? "Unable to convert data to string"
                    // Print the raw data string
                    print("Raw data: \(rawString)")
                    
                    let decodedRealtimeWeather = try JSONDecoder().decode(RealtimeWeather.self, from: data)

                    DispatchQueue.main.async {
                        self.realtimeWeather = decodedRealtimeWeather
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.errorMessage = "Decoding error: \(error.localizedDescription)"
                    }
                }
            } else {
                // Handle other status codes
                DispatchQueue.main.async {
                    self.errorMessage = "Server error: \(httpResponse.statusCode)"
                }
            }
        }
        dataTask.resume()
    }
}
