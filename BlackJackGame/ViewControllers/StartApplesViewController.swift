//
//  StartApplesViewController.swift
//  BlackJackGame
//
//  Created by Дмитрий Пермяков on 08.02.2023.
//

import UIKit

class StartApplesViewController: UIViewController {

    
    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func pressStartButton(_ sender: Any) {
        performSegue(withIdentifier: "startAppleGame", sender: nil)
    }
    
}
