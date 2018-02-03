//
//  Weather.swift
//  OpenWeatherMap
//
//  Created by Sayan Banerjee on 2/2/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

class Weather: NSObject {
    
    var base: String?
    
    var clouds: Clouds?
    
    var cod: Double?
    
    var message: String?
    
    var coord: Coord?
    
    var dt: Double?
    
    var id: Double?
    
    var main: Main?
    
    var name: String?
    
    var sys: Sys?
    
    var visibility: Double?
    
    var weather: [WeatherM] = []
    
    var wind: Wind?
    
    init(_ dictionary: Dictionary<String, Any>) {
        super.init()
        
        self.base = dictionary["base"] as? String
        
        if let clouds = dictionary["clouds"] as? Dictionary<String, Any> {
            self.clouds = Clouds(clouds)
        }
        
        self.cod = dictionary["cod"] as? Double
        
        self.message = dictionary["message"] as? String
        
        if let coord = dictionary["coord"] as? Dictionary<String, Any> {
            self.coord = Coord(coord)
        }
        
        self.dt = dictionary["dt"] as? Double
        self.id = dictionary["id"] as? Double
        
        if let main = dictionary["main"] as? Dictionary<String, Any> {
            self.main = Main(main)
        }
        
        self.name = dictionary["name"] as? String
        
        if let sys = dictionary["sys"] as? Dictionary<String, Any> {
            self.sys = Sys(sys)
        }
        
        self.visibility = dictionary["visibility"] as? Double
        
        if let weatherArray = dictionary["weather"] {
            if let castArray: [Any] = weatherArray as? Array {
                for object in castArray {
                    let weather: WeatherM = WeatherM((object as? Dictionary<String, Any>) ?? Dictionary.init())
                    self.weather.append(weather)
                }
            }
        }
        
        if let wind = dictionary["wind"] as? Dictionary<String, Any> {
            self.wind = Wind(wind)
        }
    }
}


class Clouds: NSObject {
    
    var all: Double?
    init(_ dict: Dictionary<String, Any>) {
        super.init()
        self.all = dict["all"] as? Double
    }
}


class Coord: NSObject {
    
    var lat: Double?
    var lon: Double?
    
    init(_ dict: Dictionary<String, Any>) {
        super.init()
        self.lat = dict["lat"] as? Double
        self.lon = dict["lon"] as? Double
    }
}

class Main: NSObject {
    
    var humidity: Double?
    var pressure: Double?
    var temp: Double?
    var temp_max: Double?
    var temp_min: Double?
    
    init(_ dict: Dictionary<String, Any>) {
        super.init()
        self.humidity = dict["humidity"] as? Double
        self.pressure = dict["pressure"] as? Double
        self.temp = dict["temp"] as? Double
        self.temp_max = dict["temp_max"] as? Double
        self.temp_min = dict["temp_min"] as? Double
    }
}


class Sys: NSObject {
    
    var country: String?
    var id: Double?
    var message: Double?
    var sunrise: Double?
    var sunset: Double?
    var type: Double?
    
    init(_ dict: Dictionary<String, Any>) {
        super.init()
        self.country = dict["country"] as? String
        self.id = dict["id"] as? Double
        self.message = dict["message"] as? Double
        self.sunrise = dict["sunrise"] as? Double
        self.sunset = dict["sunset"] as? Double
        self.type = dict["type"] as? Double
    }
}

class WeatherM: NSObject {
    
    var _description: String?
    var icon: String?
    var id: Double?
    var main: String?
    
    init(_ dict: Dictionary<String, Any>) {
        super.init()
        self._description = dict["description"] as? String
        self.icon = dict["icon"] as? String
        self.id = dict["id"] as? Double
        self.main = dict["main"] as? String
    }
}

class Wind: NSObject {
    
    var deg: Double?
    var speed: Double?
    
    init(_ dict: Dictionary<String, Any>) {
        super.init()
        self.deg = dict["deg"] as? Double
        self.speed = dict["speed"] as? Double
    }
}


