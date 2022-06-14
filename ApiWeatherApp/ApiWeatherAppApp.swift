//
//  ApiWeatherAppApp.swift
//  ApiWeatherApp
//
//  Created by Lucas Romero Magaña on 14/6/22.
//

import SwiftUI

@main
struct ApiWeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: WeatherViewModel(weatherService: WeatherService()))
        }
    }
}
