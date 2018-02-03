//
//  NetworkManager.swift
//  OpenWeatherMap
//
//  Created by Sayan Banerjee on 2/2/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit
typealias Completion = (Any?, Error?) -> Void

class NetworkManager: NSObject {

    static let shared = NetworkManager()
    
    var completion: Completion?
    
    func startWith(_ url: String, completion: @escaping Completion) {
        
        self.completion = completion
        let session = URLSession(configuration: .default)
        
        let baseUrl = String(format:WeatherHelper.baseURL(), url)
        
        guard let escapedURLString = baseUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        guard let request = URL(string: escapedURLString) else { return }
        
        session.dataTask(with: request) { [weak self] (data, response, error) in
            guard let `self` = self else { return }
            if let responseData = data{
                DispatchQueue.main.async {
                    self.parse(responseData)
                }
            } else {
                completion(nil, error)
            }
            }.resume()
    }
    
    func parse(_ response: Data) {
        
        do{
            let responseDict = try JSONSerialization.jsonObject(with: response as Data, options: JSONSerialization.ReadingOptions.allowFragments)
            print("Weather data received from server  = \(responseDict)")
            guard let dict = (responseDict as? Dictionary<String, Any>) else { return }
            let weather: Weather = Weather(dict)
            let weatherModelView: WeatherModelView = WeatherModelView(weather)
            
            if let completion = self.completion {
                completion(weatherModelView, nil)
            }
            
        }catch{
            print("error: \(error.localizedDescription)")
        }
    }
}


