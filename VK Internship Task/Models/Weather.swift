//
//  Weather.swift
//  VK Internship Task
//
//  Created by Dmitry Tkach on 17.07.2024.
//

class Weather {
    enum WeatherConditions: String, CaseIterable {
        case rain = "Rain"
        case clouds = "Clouds"
        case sun = "Sun"
        case fog = "Fog"
        case clear = "Clear"
    }
    
    var currentCondition: WeatherConditions
    
    init(currentCondition: WeatherConditions) {
        self.currentCondition = currentCondition
    }
}
