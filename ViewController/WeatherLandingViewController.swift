//
//  WeatherLandingViewController.swift
//  OpenWeatherMap
//
//  Created by Sayan Banerjee on 2/2/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

class WeatherLandingViewController: WeatherBaseViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var temeratureLabel: UILabel!
    @IBOutlet weak var minTempratureLabel: UILabel!
    @IBOutlet weak var maxTempratureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    var dataObject: WeatherModelView = WeatherModelView(Weather(Dictionary.init())) {
        didSet{
            self.bindData()
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(WeatherHelper.getLastSearchedCity().characters.count>0){
            apiCallWith(WeatherHelper.getLastSearchedCity())
        }
    }
    
    func bindData() {
        if dataObject.isValidWeatherResponse {
            WeatherHelper.setLastSearchedCity(self.searchTextField.text ?? "")
            self.cityLabel.text="\(dataObject.cityName) , \(dataObject.countryName)"
            self.countryLabel.text=dataObject.weatherDescription

            self.temeratureLabel.text = dataObject.tempInCelcius
            self.minTempratureLabel.text = dataObject.minTempInCelcius
            self.maxTempratureLabel.text = dataObject.maxTempInCelcius
            self.bindImage()
        } else {
            self.showMessage(dataObject.message, title: "Error")
        }
    }
    
    func bindImage() {
        WeatherImageManager.fetchImageFrom(self.dataObject.imageIconURL) { [weak self] (image) in
            guard let `self` = self else { return }
            self.iconImageView.image = image
        }
    }
    
    func apiCallWith(_ string: String) {
        self.showSpinner()
        WeatherApi.fetchWeatherDatafor(string) { [weak self] (respone, error) in
            guard let `self` = self else { return }
            self.hideSpinner()
            
            if let dataObject: WeatherModelView = respone as? WeatherModelView {
                self.dataObject = dataObject
            } else {
                self.showMessage(error.debugDescription, title: "Error")
            }
        }
    }
}

extension WeatherLandingViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let searchString = textField.text{
            textField.resignFirstResponder()
            apiCallWith(searchString)
            
        }
        return true
    }

}
