//
//  WeatherHelper.swift
//  OpenWeatherMap
//
//  Created by Sayan Banerjee on 2/2/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

struct Constant {
    static let API_KEY: String = "f40f24b564975926e2a49dc6ff958f0c"
    static let BASE_URL: String = "http://api.openweathermap.org/data/2.5/weather?q="
    
    static let ICON_BASE_URL: String = "http://openweathermap.org/img/w/%@.png"
    
    static let DEFAULT_TEMP: Double = 0
    static let DEFAULT_SEARCH_CITY: String = "Cupertino"
    static let LAST_SEARCHED_CITY: String = "lastCity"
}

struct WeatherHelper {
    static func baseURL() -> String {
        return "\(Constant.BASE_URL)%@&APPID=\(Constant.API_KEY)"
    }
    
    static func getLastSearchedCity() -> String {
        return (UserDefaults.standard.object(forKey: Constant.LAST_SEARCHED_CITY) as? String) ?? ""
    }
    
    static func setLastSearchedCity(_ city: String) {
        UserDefaults.standard.set(city, forKey: Constant.LAST_SEARCHED_CITY)
    }
    
}
