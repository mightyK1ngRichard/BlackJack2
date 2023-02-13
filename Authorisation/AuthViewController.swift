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
        if loginLabel.text == "mightyK1ngRichard@gmail.com" {
            loginLabel.text = ""
        }
    }
    
    @IBAction func pressPassword(_ sender: Any) {
        if passwordLabel.text == "***********" {
            passwordLabel.text = ""
        }
    }
    
    @IBAction func pressPasswordDid(_ sender: Any) {
        if passwordLabel.text == "" {
            passwordLabel.text = "***********"
        }
    }
    
    @IBAction func pressLoginDid(_ sender: Any) {
        if loginLabel.text == "" {
            loginLabel.text = "mightyK1ngRichard@gmail.com"
        }
    }
    
    @IBAction func pressRegister(_ sender: Any) {
        // TODO: - сделать проверку пароля.
//        performSegue(withIdentifier: "goToStartMenuFromAuth", sender: nil)
    }
    
    // MARK: - datas
//    private var words = 0
    
}
