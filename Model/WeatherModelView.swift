//
//  WeatherModelView.swift
//  OpenWeatherMap
//
//  Created by Sayan Banerjee on 2/2/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

class WeatherModelView: NSObject {

    var weather: Weather?
    
    init(_ weather: Weather?) {
        super.init()
        self.weather = weather
    }
    
    var weatherDescription: String {
        guard let weather = self.weather else { return "" }
        guard let weatherObject = weather.weather.first else { return "" }
        return weatherObject._description ?? ""
    }
    
    var imageIconURL: String {
        guard let weather = self.weather else { return "" }
        guard let weatherObject = weather.weather.first else { return "" }
        return String(format:Constant.ICON_BASE_URL, weatherObject.icon ?? "")
    }
    
    var temperature: Double {
        guard let weather = self.weather else { return Constant.DEFAULT_TEMP }
        guard let main = weather.main else { return Constant.DEFAULT_TEMP }
        guard let temp = main.temp else { return Constant.DEFAULT_TEMP }
        return temp
    }
    
    var temperatureMin: Double {
        guard let weather = self.weather else { return Constant.DEFAULT_TEMP }
        guard let main = weather.main else { return Constant.DEFAULT_TEMP }
        guard let min = main.temp_min else { return Constant.DEFAULT_TEMP }
        return min
    }
    
    var temperatureMax: Double {
        guard let weather = self.weather else { return Constant.DEFAULT_TEMP }
        guard let main = weather.main else { return Constant.DEFAULT_TEMP }
        guard let max = main.temp_max else { return Constant.DEFAULT_TEMP }
        return max
    }
    
    var cityName: String {
        guard let weather = self.weather else { return "" }
        return weather.name ?? ""
    }
    var countryName: String {
        guard let weather = self.weather else { return "" }
        guard let sys = weather.sys else { return "" }
        guard let country = sys.country else { return "" }
        return country 
    }
    
    var isValidWeatherResponse: Bool {
        guard let weather = self.weather else { return false }
        return weather.cod == 200
    }
    
    var message: String {
        guard let weather = self.weather else { return "" }
        return weather.message ?? ""
    }
    var tempInCelcius: String {
        return WeatherConvertor.convertTemperature(temp: temperature, inputUnit:.Kelvin, outputUnit: .Celsius)
    }
    
    var minTempInCelcius: String {
        return WeatherConvertor.convertTemperature(temp: temperatureMin, inputUnit:.Kelvin, outputUnit: .Celsius)
    }
    
    var maxTempInCelcius: String {
        return WeatherConvertor.convertTemperature(temp: temperatureMax, inputUnit:.Kelvin, outputUnit: .Celsius)
    }
}

