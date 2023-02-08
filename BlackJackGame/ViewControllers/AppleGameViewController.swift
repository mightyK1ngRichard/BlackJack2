//
//  AppleGameViewController.swift
//  BlackJackGame
//
//  Created by Дмитрий Пермяков on 08.02.2023.
//

import UIKit

class AppleGameViewController: UIViewController {
    
    @IBOutlet var cardButton: [UIButton]!
    @IBOutlet weak var statusGame: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startSetColorForButtons()
        
    }

    @IBAction func pressButton(_ sender: Any) {
        let gameSettings = AppleGame.shared
        if gameSettings.statusGame {
            if let currentButton = cardButton.firstIndex(of: sender as! UIButton) {
                let indexPressedButton = cardButton[currentButton].tag
                // вывожу всю строку.
                let indexFirstValueOfCurrentRow = gameSettings.indexCurrentGameRow
                if indexFirstValueOfCurrentRow <= indexPressedButton &&  indexPressedButton < indexFirstValueOfCurrentRow + 5 {
                    var listOfTitles = gameSettings.getTitle()
                    cardButton[indexPressedButton].backgroundColor = .green
                    for buttonsOfCurrentRow in 0 ..< 5 {
                        cardButton[indexFirstValueOfCurrentRow + buttonsOfCurrentRow].setTitle(listOfTitles.popLast() , for: .normal)
                        cardButton[indexFirstValueOfCurrentRow + buttonsOfCurrentRow].backgroundColor = #colorLiteral(red: 0.5855087042, green: 0.5558546185, blue: 0.9187170267, alpha: 1)
                    }
                    gameSettings.indexCurrentGameRow += 5
                    
                    if gameSettings.counterRow == 5 {
                        statusGame.isHidden = false
                        statusGame.text = "Вы победили!"
                        statusGame.tintColor = .green
                        gameSettings.resetGame()
                    }
                    gameSettings.increaceCurrentGameRow()
                }
                
                if cardButton[indexPressedButton].title(for: .normal) == typesTitleCard.redApple.rawValue {
                    gameSettings.statusGame = false
                    statusGame.isHidden = false
                    statusGame.text = "Вы проиграли!"
                    statusGame.tintColor = .red
                    gameSettings.resetGame()
                }
                AppleGame.shared.nextStepGame()
            }
        }
    }
    
    // MARK: - Functions.
    private func startSetColorForButtons() {
        var count = 0
        for index in cardButton.indices {
            cardButton[index].setTitle("", for: .normal)
            cardButton[index].backgroundColor = #colorLiteral(red: 1, green: 0.6800273061, blue: 0.9017712474, alpha: 0.2796202401)
            cardButton[index].tag = count
            count += 1
        }
    }
    
    private func resetGame() {
        AppleGame.shared.resetGame()
        startSetColorForButtons()
    }
}
