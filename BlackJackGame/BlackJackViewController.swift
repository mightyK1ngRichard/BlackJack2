//
//  GameViewController.swift
//  MyPersonalApp
//
//  Created by Дмитрий Пермяков on 31.01.2023.
//

import UIKit

class BlackJackViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var dealerSumLabel: UILabel!
    @IBOutlet weak var resultGameLabel: UILabel!
    @IBOutlet weak var userCardLabel: UIImageView!
    @IBOutlet weak var dealerCardLabel: UIImageView!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var takeCardButton: UIButton!
    @IBOutlet weak var stopTakeCardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GameBlackJack.shared.resetGame()
    }
    
    // MARK: - Actions
    @IBAction func pressTakeCard(_ sender: Any) {
        loadDataOnVC()
    }
    
    @IBAction func pressStop(_ sender: Any) {
        if !stopGame() {
            let (userSum, dealerSum) = GameBlackJack.shared.getGameResult()
            resultGameLabel.isHidden = false
            if userSum > dealerSum {
                resultGameLabel.text = "You win!"
                resultGameLabel.textColor = .green
                // TODO: - сделать видео человека паука
//                flexScreen()
                alertMessage(statusGame: "победили!")
                
            } else if userSum < dealerSum{
                // TODO: - сделать видео лунтика
                resultGameLabel.text = "You lose!"
                resultGameLabel.textColor = .red
                alertMessage(statusGame: "проиграли!")
            } else {
                resultGameLabel.text = "A tie!"
                resultGameLabel.textColor = .green
                alertMessage(statusGame: "сыграли в ничью!")
            }
        } else {
            alertMessage(statusGame: "победили!")
        }
        GameBlackJack.shared.resetGame()
    }
    
    // MARK: - functions
    private func loadDataOnVC() {
        sumLabel.isHidden = false
        let res = GameBlackJack.shared.TakeCard()
        if let name = res.1 {
            let userSum = res.0
            if userCardLabel.isHidden {
                userCardLabel.isHidden = false
            }
            sumLabel.text = "\(userSum)"
            userCardLabel.image = UIImage(named: name)
            if userSum > 21 {
                resultGameLabel.isHidden = false
                resultGameLabel.textColor = .red
                resultGameLabel.text = "You lose!"
                takeCardButton.isHidden = true
                stopTakeCardButton.isHidden = true
                // TODO: - сделать лунтика
                loseScreen()
                alertMessage(statusGame: "проиграли!")
                return
            }
            
        } else {
            
            print("Это невозможно.")
        }
    }
    
    private func stopGame() -> Bool {
        takeCardButton.isHidden = true
        stopTakeCardButton.isHidden = true
        dealerSumLabel.isHidden = false
        dealerCardLabel.isHidden = false
        while true {
            let res = GameBlackJack.shared.StepDealer()
            if let name = res.1 {
                let dealerSum = res.0
                if dealerCardLabel.isHidden {
                    dealerCardLabel.isHidden = false
                }
                dealerSumLabel.text = "\(dealerSum)"
                dealerCardLabel.image = UIImage(named: name)
                
                if dealerSum > 21 {
                    resultGameLabel.isHidden = false
                    resultGameLabel.textColor = .green
                    resultGameLabel.text = "You win!"
                    return true
                }
                
                if dealerSum >= 16 {
                    return false
                }
            } else {
                print("Это невозможно")
                return false
            }
            
        }
    }
    
    private func flexScreen() {
        
    }
    
    private func loseScreen() {
        
    }
    
    private func alertMessage(statusGame: String) {
        let alertController = UIAlertController(title: "Вы \(statusGame)", message: nil, preferredStyle: .actionSheet)
        let newGameAction = UIAlertAction(title: "Новая игра", style: .destructive) { [weak self] (_) in
            self?.newGame()
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
    
    private func newGame() {
        GameBlackJack.shared.resetGame()
        resultGameLabel.isHidden = true
        dealerSumLabel.isHidden = true
        userCardLabel.image = UIImage(named: "backCard")
        dealerCardLabel.image = UIImage(named: "backCard")
        sumLabel.isHidden = true
        takeCardButton.isHidden = false
        stopTakeCardButton.isHidden = false
    }
}
