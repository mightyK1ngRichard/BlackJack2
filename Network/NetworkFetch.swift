//
//  NetworkFetch.swift
//  BlackJackGame
//
//  Created by Дмитрий Пермяков on 07.02.2023.
//

import Foundation

struct StatusWeather: Decodable {
//    let coord: Coordinates
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let id: Int
    let name: String
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

//struct Coordinates: Decodable {
//    let lon: Double
//    let lat: Double
//}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Double
    let sea_level: Double
    let grnd_level: Double
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
    let gust: Double
}

class NetworkFetch {
    static let shared = NetworkFetch()
    //  https://api.openweathermap.org/data/2.5/weather?appid=d2d5eba60bb37a00ce164aea31b6b7ae&q=Moscow
    let myKey = "d2d5eba60bb37a00ce164aea31b6b7ae"
    let urlString = "https://api.openweathermap.org/data/2.5/weather?"
    var cityName: String =  "Moscow"
    
    func APIManager(completion: @escaping (StatusWeather?, String?) -> Void) {
        guard let url = URL(string: urlString + "appid=" + myKey + "&q=" + cityName) else {
            completion(nil, "Ошибка открытия url")
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data else { return }
                if let newInfo = try? JSONDecoder().decode(StatusWeather.self, from: data) {
                    completion(newInfo, nil)
//                    UserDefaults.standard.setValue(newInfo, forKey: "Weather")
                    
                } else {
                    print("Error from NetworkFetch")
                }
            }
        }.resume()
        
    }
}
