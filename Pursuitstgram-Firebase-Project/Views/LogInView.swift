//
//  LogIn.swift
//  Pursuitstgram-Firebase-Project
//
//  Created by Eric Widjaja on 11/23/19.
//  Copyright © 2019 Eric.W. All rights reserved.
//

import UIKit
import FirebaseAuth


class LogInView: UIView {

    var projectTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "P U R S U I T S T G R A M"
        label.font = UIFont(name: "Noteworthy-Bold", size: 28)
        label.textColor = UIColor.white
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    var emailTxtField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "email?"
        textField.font = UIFont(name: "Noteworthy", size: 16)
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        return textField
    }()
    lazy var passwordTxtField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password?"
        textField.font = UIFont(name: "Noteworthy", size: 16)
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        return textField
    }()

    

}
