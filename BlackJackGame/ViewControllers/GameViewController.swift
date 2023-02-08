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
        startButton.layer.shadowRadius = 5
        startButton.layer.cornerRadius = 10
        startButton.backgroundColor = #colorLiteral(red: 0.7562164664, green: 0.4985180497, blue: 0.9188113213, alpha: 1)
        startButton.titleLabel?.textColor = #colorLiteral(red: 0.6315690279, green: 0.9753151536, blue: 1, alpha: 1)
    }

}
