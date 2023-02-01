//
//  GameViewController.swift
//  BlackJackGame
//
//  Created by Дмитрий Пермяков on 01.02.2023.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.backgroundColor = .red
        startButton.titleLabel?.textColor = .black
        startButton.layer.shadowRadius = 8
        startButton.layer.cornerRadius = 20
        mainLabel.textColor = .red
    }
    

   

}
