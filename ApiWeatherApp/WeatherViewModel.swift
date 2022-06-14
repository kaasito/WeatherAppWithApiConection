//
//  WeatherViewModel.swift
//  ApiWeatherApp
//
//  Created by Lucas Romero Magaña on 14/6/22.
//

import Foundation

private let defaultIcon = "⁉️"
private let iconMap = [
    "Drizzle" : "🌧",
    "Thunderstorm" : "⛈",
    "Rain" : "☔️",
    "Snow" : "🌨",
    "Clouds" : "☁️",
    "Clear" : "☀️"
]


class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "CityName"
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    
    public let weatherService: WeatherService
    
    init(weatherService: WeatherService ) {
        self.weatherService = weatherService
    }
    
    func refresh() {
        weatherService.loadWeatherData {weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)ºC"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
        }
    }
}
