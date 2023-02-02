//
//  BlackJack.swift
//  MyPersonalApp
//
//  Created by Дмитрий Пермяков on 31.01.2023.
//

import Foundation

enum Suit: String {
    case Hearts = "♥️"
    case Diamonds = "♦️"
    case Clubs = "♣️"
    case Spades = "♠️"
}

struct Card {
    var suit: Suit
    var cardInfo: String
    var number: Int
}

let allCards = [
    Card(suit: .Clubs, cardInfo: "2к", number: 2),
    Card(suit: .Clubs, cardInfo: "3к", number: 3),
    Card(suit: .Clubs, cardInfo: "4к", number: 4),
    Card(suit: .Clubs, cardInfo: "5к", number: 5),
    Card(suit: .Clubs, cardInfo: "6к", number: 6),
    Card(suit: .Clubs, cardInfo: "7к", number: 7),
    Card(suit: .Clubs, cardInfo: "8к", number: 8),
    Card(suit: .Clubs, cardInfo: "9к", number: 9),
    Card(suit: .Clubs, cardInfo: "10к", number: 10),
    Card(suit: .Clubs, cardInfo: "вк", number: 8),
    Card(suit: .Clubs, cardInfo: "корк", number: 9),
    Card(suit: .Clubs, cardInfo: "кк", number: 10),
    Card(suit: .Clubs, cardInfo: "тк", number: 11),
    
    Card(suit: .Diamonds, cardInfo: "2б", number: 2),
    Card(suit: .Diamonds, cardInfo: "3б", number: 3),
    Card(suit: .Diamonds, cardInfo: "4б", number: 4),
    Card(suit: .Diamonds, cardInfo: "5б", number: 5),
    Card(suit: .Diamonds, cardInfo: "6б", number: 6),
    Card(suit: .Diamonds, cardInfo: "7б", number: 7),
    Card(suit: .Diamonds, cardInfo: "8б", number: 8),
    Card(suit: .Diamonds, cardInfo: "9б", number: 9),
    Card(suit: .Diamonds, cardInfo: "10б", number: 10),
    Card(suit: .Diamonds, cardInfo: "вб", number: 8),
    Card(suit: .Diamonds, cardInfo: "корб", number: 9),
    Card(suit: .Diamonds, cardInfo: "кб", number: 10),
    Card(suit: .Diamonds, cardInfo: "тб", number: 11),
    
    Card(suit: .Hearts, cardInfo: "2ч", number: 2),
    Card(suit: .Hearts, cardInfo: "3ч", number: 3),
    Card(suit: .Hearts, cardInfo: "4ч", number: 4),
    Card(suit: .Hearts, cardInfo: "5ч", number: 5),
    Card(suit: .Hearts, cardInfo: "6ч", number: 6),
    Card(suit: .Hearts, cardInfo: "7ч", number: 7),
    Card(suit: .Hearts, cardInfo: "8ч", number: 8),
    Card(suit: .Hearts, cardInfo: "9ч", number: 9),
    Card(suit: .Hearts, cardInfo: "10ч", number: 10),
    Card(suit: .Hearts, cardInfo: "вч", number: 8),
    Card(suit: .Hearts, cardInfo: "корч", number: 9),
    Card(suit: .Hearts, cardInfo: "кч", number: 10),
    Card(suit: .Hearts, cardInfo: "тч", number: 11),
    
    Card(suit: .Spades, cardInfo: "2п", number: 2),
    Card(suit: .Spades, cardInfo: "3п", number: 3),
    Card(suit: .Spades, cardInfo: "4п", number: 4),
    Card(suit: .Spades, cardInfo: "5п", number: 5),
    Card(suit: .Spades, cardInfo: "6п", number: 6),
    Card(suit: .Spades, cardInfo: "7п", number: 7),
    Card(suit: .Spades, cardInfo: "8п", number: 8),
    Card(suit: .Spades, cardInfo: "9п", number: 9),
    Card(suit: .Spades, cardInfo: "10п", number: 10),
    Card(suit: .Spades, cardInfo: "вп", number: 8),
    Card(suit: .Spades, cardInfo: "корп", number: 9),
    Card(suit: .Spades, cardInfo: "кп", number: 10),
    Card(suit: .Spades, cardInfo: "тп", number: 11),
    
]

class GameBlackJack {
    static var shared = GameBlackJack()
    private var userSum = 0
    private var cardsForGame = allCards
    private var dealerSum = 0
    
    func getGameResult() -> (Int, Int){
        return (userSum, dealerSum)
    }

    func TakeCard() -> (Int, String?, String?) {
        cardsForGame.shuffle()
        if let takenCard = cardsForGame.popLast() {
            userSum += takenCard.number
            return (userSum, takenCard.cardInfo, takenCard.suit.rawValue)
        }
        return (userSum, nil, nil)
    }
    
    func StepDealer() -> (Int, String?, String?) {
        cardsForGame.shuffle()
        if let takenCard = cardsForGame.popLast() {
            dealerSum += takenCard.number
            return (dealerSum, takenCard.cardInfo, takenCard.suit.rawValue)
        }
        return (dealerSum, nil, nil)
    }
    
    func resetGame() {
        userSum = 0
        dealerSum = 0
        cardsForGame = allCards
    }
}
