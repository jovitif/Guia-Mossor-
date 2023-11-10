//
//  fetchAPI.swift
//  final
//
//  Created by Pablo on 07/11/23.
//

import Foundation

struct Weather: Decodable {
    let current: Current
}

struct Current: Decodable {
    let temp_c: Double
    let is_day: Int
    let condition: Condition
    let wind_mph: Double
    let pressure_mb: Double
    let humidity: Int
    let feelslike_c: Double
}

struct Condition: Decodable {
    let icon: String
}

class FetchData: ObservableObject {
    @Published var weatherData: Weather?

    func getData() {
        let url = "https://api.weatherapi.com/v1/forecast.json?key=ee81ed621bb540a1983190231233010&q=Mossoro&days=3&aqi=yes&alerts=yes"
        let session = URLSession(configuration: .default)

        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }

            do {
                let jsonData = try JSONDecoder().decode(Weather.self, from: data!)
                DispatchQueue.main.async {
                    self.weatherData = jsonData
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


