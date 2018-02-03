//
//  weatherConvertor.swift
//  OpenWeatherMap
//
//  Created by Sayan Banerjee on 2/2/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

class WeatherConvertor: NSObject {
    
    enum TempUnit: String {
        case Kelvin = "Kelvin"
        case Celsius = "Celsius"
        case Fahrenheit = "Fahrenheit"
    }
    
   static func convertTemperature(temp:Double, inputUnit:TempUnit, outputUnit:TempUnit) -> String{
        switch inputUnit {
        case .Kelvin:
            switch outputUnit{
            case .Kelvin: return String(format: "%0.2f",temp)
            case .Celsius: return String(format: "%0.2f",temp - 273.15)
            case .Fahrenheit: return String(format: "%0.2f",9/5*(temp-273.15) + 32)
            }
        case .Celsius:
            switch outputUnit{
            case .Kelvin: return String(format: "%0.2f",temp + 273.15)
            case .Celsius: return String(format: "%0.2f",temp)
            case .Fahrenheit: return String(format: "%0.2f",(9/5*(temp) + 32))
            }
        case .Fahrenheit:
            switch outputUnit{
            case .Kelvin: return String(format: "%0.2f",(5/9*(temp - 32) + 273.15))
            case .Celsius: return String(format: "%0.2f", (5/9 * (temp-32)))
            case .Fahrenheit:return String(format: "%0.2f",(temp))
            }
        }
    }
}
