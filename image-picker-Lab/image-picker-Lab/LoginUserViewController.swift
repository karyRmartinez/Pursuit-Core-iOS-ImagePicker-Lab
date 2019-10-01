//
//  LoginUserViewController.swift
//  image-picker-Lab
//
//  Created by Kary Martinez on 10/1/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import UIKit

class LoginUserViewController: UIViewController {
    
    var loginVC = ImageViewController()
    let userName: String = "kary"
    let password: String = "123"
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var userNameTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    func setTextFieldText () {
    userNameTextfield.text = userName
        passwordTextField.text = password
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserName()
        setTextFieldText()
    }
    private func setupUserName(){
        userNameLabel.layer.shadowColor = UIColor.black.cgColor
      
    }
    
    private func SetUpPassword() {
        passwordLabel.layer.shadowColor = UIColor.black.cgColor
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destVC = storyboard.instantiateViewController(withIdentifier: "secondVC") as! ImageViewController
        
        
        self.navigationController?.pushViewController(destVC, animated: true)
        
        
//        present(destVC, animated: true, completion: nil)
        
    }
    
    
    
    
}
    
    
    

