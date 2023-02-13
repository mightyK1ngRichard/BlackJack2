//
//  AppleGame.swift
//  BlackJackGame
//
//  Created by Дмитрий Пермяков on 08.02.2023.
//

import Foundation

enum typesTitleCard: String {
    case redApple   = "🍎"
    case greenApple = "🍏"
}

class AppleGame {
    static let shared = AppleGame()
    var indexCurrentGameRow: Int = 0
    private var titlesForCard = ["🍎", "🍏", "🍏", "🍏", "🍏"]
    var counterRow = 0
    var statusGame = true
    
    func resetGame() {
        indexCurrentGameRow = 0
        titlesForCard = ["🍎", "🍏", "🍏", "🍏", "🍏"]
        counterRow = 0
        statusGame = true
    }
    
    func getTitle() -> [String] {
        titlesForCard.shuffle()
        return titlesForCard
    }
    
    func increaceCurrentGameRow() {
        counterRow += 1
    }
    
    func nextStepGame() {
        switch counterRow {
        case 2:
            titlesForCard[titlesForCard.firstIndex(of: typesTitleCard.greenApple.rawValue)!] = typesTitleCard.redApple.rawValue
        case 4:
            titlesForCard[titlesForCard.firstIndex(of: typesTitleCard.greenApple.rawValue)!] = typesTitleCard.redApple.rawValue
        case 5:
            titlesForCard[titlesForCard.firstIndex(of: typesTitleCard.greenApple.rawValue)!] = typesTitleCard.redApple.rawValue
        default:
            break
        }
    }
}
