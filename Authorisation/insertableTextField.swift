//
//  insertableTextField.swift
//  BlackJackGame
//
//  Created by Дмитрий Пермяков on 12.02.2023.
//

import UIKit

class insertableTextField: UITextField {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.5501983762, green: 0.1330439448, blue: 0.4679858685, alpha: 0.4866699219)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 6)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}

