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

