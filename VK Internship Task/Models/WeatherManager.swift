//
//  WeatherManager.swift
//  VK Internship Task
//
//  Created by Dmitry Tkach on 17.07.2024.
//

import UIKit

class WeatherManager {
    private var currentWeather: Weather
    
    init() {
        self.currentWeather = Weather(currentCondition: Weather.WeatherConditions.allCases.randomElement()!)
    }
}

extension WeatherManager {
    
    func setWeather(to condition: Weather.WeatherConditions) {
        currentWeather.currentCondition = condition
    }
    
    func getWeather() -> Weather {
        return currentWeather
    }
    
    func getCurrentWeatherCondition() -> Weather.WeatherConditions {
        return currentWeather.currentCondition
    }
    
    func getCurrentWeatherBackground() -> UIImage {
        switch currentWeather.currentCondition {
        case .clear:
            return UIImage(named: "ClearSkyBackgound.jpg")!
        case .clouds:
            return UIImage(named: "CloudsBackground.jpg")!
        case .fog:
            return UIImage(named: "FoggyBackground.jpg")!
        case .rain:
            return UIImage(named: "RainyBackground.jpg")!
        case .sun:
            return UIImage(named: "SunnyBackground.jpeg")!
        }
    }
    
    func getConditionNames() -> [String] {
        var result = [String]()
        
        for condition in Weather.WeatherConditions.allCases {
            result.append(condition.rawValue)
        }
        
        return result
    }
}
