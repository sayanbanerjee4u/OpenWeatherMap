//
//  WeatherImageManager.swift
//  OpenWeatherMap
//
//  Created by Sayan Banerjee on 2/2/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

import UIKit

struct WeatherImageManager {
    
    static func fetchImageFrom(_ url: String, completion: @escaping (_ image: UIImage) -> Void) {
        
        let imgUrl = URL(string: url)
        
        let data:NSData? = NSData.init(contentsOf: imgUrl!)
        
        if let imgData = data{
            guard let image = UIImage.init(data: imgData as Data) else { return }
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}

