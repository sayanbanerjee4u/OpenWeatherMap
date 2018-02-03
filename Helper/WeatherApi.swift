//
//  WeatherApi.swift
//  OpenWeatherMap
//
//  Created by Sayan Banerjee on 2/2/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

struct WeatherApi {
    
    static func fetchWeatherDatafor(_ city: String = Constant.DEFAULT_SEARCH_CITY, completion:@escaping Completion) {
        NetworkManager.shared.startWith(city) { (response, error) in
            completion(response, error)
        }
    }
}
