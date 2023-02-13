//
//  DictionaryViewController.swift
//  BlackJackGame
//
//  Created by Дмитрий Пермяков on 13.02.2023.
//

import UIKit

class DictionaryViewController: UIViewController {

    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var russianLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var addWordButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func nextClick(_ sender: Any) {
        
    }
    
    @IBAction func backClick(_ sender: Any) {
        
    }
    
    @IBAction func addClick(_ sender: Any) {
        performSegue(withIdentifier: "goToAddWord", sender: nil)
    }
    
    @IBAction func openDictionaryClick(_ sender: Any) {
        performSegue(withIdentifier: "goToAllWords", sender: nil)
    }
    
}
