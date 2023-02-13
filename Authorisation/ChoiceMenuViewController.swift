//
//  ChoiceMenuViewController.swift
//  CruelApplication
//
//  Created by Дмитрий Пермяков on 13.02.2023.
//

import UIKit

class ChoiceMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dictionaryButton(_ sender: Any) {
        performSegue(withIdentifier: goToDictionary, sender: nil)
    }
    
    @IBAction func CasinoButton(_ sender: Any) {
        performSegue(withIdentifier: goToCasino, sender: nil)
    }
    
    @IBAction func weatherButton(_ sender: Any) {
        performSegue(withIdentifier: goToWeather, sender: nil)
    }
    
    // MARK: - indetifiers
    private let goToDictionary = "goToDictionary"
    private let goToCasino = "goToCasino"
    private let goToWeather = "goToWeather"
}
