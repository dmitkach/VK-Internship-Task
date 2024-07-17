//
//  Weather.swift
//  VK Internship Task
//
//  Created by Dmitry Tkach on 17.07.2024.
//

class Weather {
    enum WeatherConditions: CaseIterable {
        case rain
        case clouds
        case sun
        case fog
        case clear
    }
    
    var temperature: Double = 24.0
    var windSpeed: Double = 4.5
    var currentCondition: WeatherConditions
    
    init(currentCondition: WeatherConditions) {
        self.currentCondition = currentCondition
    }
}
