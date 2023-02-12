//
//  WeatherViewController.swift
//  BlackJackGame
//
//  Created by Дмитрий Пермяков on 07.02.2023.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 273.15
        NetworkFetch.shared.APIManager() { [weak self] (data, error) in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                if let temperature = data?.main.temp {
                    print(temperature - 273.15)
                    self.temperatureLabel.text = "\(Int(round(temperature - 273.15))) ºC"
                } else {
                    self.temperatureLabel.text = "Не известно"
                }
                self.cityLabel.text = data?.name
            }
        }
    }
}
