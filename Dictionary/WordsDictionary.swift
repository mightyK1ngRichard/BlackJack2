//
//  WordsDictionary.swift
//  BlackJackGame
//
//  Created by Дмитрий Пермяков on 13.02.2023.
//

import Foundation

class WordsDictionary: Codable {
    let engWord: String
    let rusWord: String
    static var wordId = 0
    
    init(eng: String, rus: String) {
        self.engWord = eng
        self.rusWord = rus
        WordsDictionary.wordId += 1
    }
}
