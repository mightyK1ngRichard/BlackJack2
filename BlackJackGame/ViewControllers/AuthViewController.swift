//
//  AuthViewController.swift
//  BlackJackGame
//
//  Created by Дмитрий Пермяков on 12.02.2023.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var loginLabel: insertableTextField!
    @IBOutlet weak var passwordLabel: insertableTextField!
    @IBOutlet weak var registerLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressLogin(_ sender: Any) {
        loginLabel.text = ""
    }
    
    @IBAction func pressPassword(_ sender: Any) {
        passwordLabel.text = ""
    }
    
    @IBAction func pressPasswordDid(_ sender: Any) {
        print(passwordLabel.text ?? "")
    }
    
    @IBAction func pressLoginDid(_ sender: Any) {
        print(loginLabel.text ?? "")
    }
    
    @IBAction func pressRegister(_ sender: Any) {
        // TODO: - сделать проверку пароля.
        print(loginLabel.text ?? "")
        print(passwordLabel.text ?? "")
        performSegue(withIdentifier: "goToStartMenuFromAuth", sender: nil)
    }
}
