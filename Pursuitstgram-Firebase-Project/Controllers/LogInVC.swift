//  LogInVC.swift
//  Pursuitstgram-Firebase-Project
//
//  Created by Eric Widjaja on 11/18/19.
//  Copyright © 2019 Eric.W. All rights reserved.


import UIKit
import FirebaseAuth

class LogInVC: UIViewController {
    
    var logInEmail: UITextField?
    var logInPassword: UITextField?
    var loginView = LogInView()
    
    
//MARK: @OBJC Functions
    @objc func signInButtonPressed() {
        let signInButton = loginView.signInButton
        guard let email = loginView.emailTxtField.text, !email.isEmpty,
            let password = loginView.passwordTxtField.text, !password.isEmpty
            else {
                print("showAlertFunc")
//            showAlert(with: "Required", and: "Please enter both fields")
            return
        }
        
//        FirebaseAuthService.manager.loginUser(email: email.lowercased(), password: password) { (result) in
//            self.handleLoginResponse(with: result)
        }

    
    
    
    private func setLogInView() {
        view.addSubview(loginView)
        self.view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        
    }

//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLogInView()
        
    }


}

