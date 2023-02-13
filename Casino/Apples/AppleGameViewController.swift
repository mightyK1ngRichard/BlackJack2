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

    @IBAction func pressButton(_ sender: UIButton) {
        let gameSettings = AppleGame.shared
        if gameSettings.statusGame {
            if let currentButton = cardButton.firstIndex(of: sender) {
                let indexPressedButton = cardButton[currentButton].tag
                // вывожу всю строку.
                let indexFirstValueOfCurrentRow = gameSettings.indexCurrentGameRow
                if indexFirstValueOfCurrentRow <= indexPressedButton &&  indexPressedButton < indexFirstValueOfCurrentRow + 5 {
                    var listOfTitles = gameSettings.getTitle()
                    for buttonsOfCurrentRow in 0 ..< 5 {
                        cardButton[indexFirstValueOfCurrentRow + buttonsOfCurrentRow].setTitle(listOfTitles.popLast() , for: .normal)
                        cardButton[indexFirstValueOfCurrentRow + buttonsOfCurrentRow].backgroundColor = #colorLiteral(red: 0.3336286247, green: 0.30895105, blue: 0.4993824363, alpha: 1)
                        cardButton[indexFirstValueOfCurrentRow + buttonsOfCurrentRow].isEnabled = false
                        cardButton[indexFirstValueOfCurrentRow + buttonsOfCurrentRow].layer.cornerRadius = 5
                        
                    }
                    cardButton[indexPressedButton].backgroundColor = #colorLiteral(red: 0.2039955556, green: 0.1922803521, blue: 0.3154127002, alpha: 1)
                    gameSettings.indexCurrentGameRow += 5
                    
                    if gameSettings.counterRow == 5 {
                        statusGame.isHidden = false
                        statusGame.text = "Вы победили!"
                        statusGame.textColor = .green
                        gameSettings.resetGame()
                        alertMessage(statusGame: "победили")
                    }
                    gameSettings.increaceCurrentGameRow()
                }
                
                if cardButton[indexPressedButton].title(for: .normal) == typesTitleCard.redApple.rawValue {
                    gameSettings.statusGame = false
                    statusGame.isHidden = false
                    statusGame.text = "Вы проиграли!"
                    statusGame.textColor = .red
                    gameSettings.resetGame()
                    alertMessage(statusGame: "проиграли")
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
            cardButton[index].backgroundColor = #colorLiteral(red: 0.3961045742, green: 0.3227311373, blue: 0.4895982146, alpha: 1)
            cardButton[index].layer.cornerRadius = 5
            cardButton[index].tag = count
            count += 1
        }
    }
    
    private func resetGame() {
        for i in 0..<30 {
            cardButton[i].isEnabled = true
        }
        statusGame.isHidden = true
        AppleGame.shared.resetGame()
        startSetColorForButtons()
    }
    
    private func alertMessage(statusGame: String) {
        let alertController = UIAlertController(title: "Вы \(statusGame)", message: nil, preferredStyle: .actionSheet)
        let newGameAction = UIAlertAction(title: "Новая игра", style: .destructive) { [weak self] (_) in
            self?.resetGame()
        }
        let backAction = UIAlertAction(title: "Назад", style: .default) { [weak self] (_) in
            self?.navigationController?.popViewController(animated: true)
        }
        let watchResult = UIAlertAction(title: "Смотреть результаты", style: .default)
        alertController.addAction(newGameAction)
        alertController.addAction(watchResult)
        alertController.addAction(backAction)
        self.present(alertController, animated: true)
    }
    
}
