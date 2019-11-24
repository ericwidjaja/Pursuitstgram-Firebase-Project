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

//MARK: - Objects
    var projectTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "P U R S U I T S T G R A M"
        label.font = UIFont(name: "Noteworthy-Bold", size: 32)
        label.textColor = UIColor.white
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    var emailTxtField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "email?"
        textField.font = UIFont(name: "Noteworthy", size: 16)
        textField.backgroundColor = .white
        textField.borderStyle = .bezel
        textField.autocorrectionType = .no
        return textField
    }()
    lazy var passwordTxtField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password?"
        textField.font = UIFont(name: "Noteworthy", size: 16)
        textField.backgroundColor = .white
        textField.borderStyle = .bezel
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        button.layer.cornerRadius = 8
        button.setTitle("SIGN IN", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: 16)
        return button
    }()
    
    var createNewAcctButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Create a New Account?    ",attributes: [
            NSAttributedString.Key.font: UIFont(name: "Noteworthy", size: 18)!,
            NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign Up",
                                                  attributes: [NSAttributedString.Key.font: UIFont(name: "Noteworthy-Bold", size: 18)!,
                                                               
                                NSAttributedString.Key.foregroundColor:  UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    lazy var objectsViewArray = [self.projectTitle, self.emailTxtField, self.passwordTxtField, self.signInButton, self.createNewAcctButton]
    
    
    //MARK:Add ViewsToSubviews
    func addViewsToSubView() {
        for aView in objectsViewArray {
            self.addSubview(aView)
            aView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
//MARK: Constraints
    func setConstraints() {
        addViewsToSubView()
        titleConstraints()
        emailTextFieldConstraints()
        passwordTextFieldConstraints()
        enterButtonConstraints()
        createAcctButtonConstraints()
    }
    
    private func titleConstraints() {
        NSLayoutConstraint.activate([
        projectTitle.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        projectTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 60),
        projectTitle.heightAnchor.constraint(equalToConstant: 100), projectTitle.widthAnchor.constraint(equalToConstant: 400)])
    }
    
    private func emailTextFieldConstraints() {
        NSLayoutConstraint.activate([
        emailTxtField.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor,constant: 35),
        emailTxtField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        emailTxtField.heightAnchor.constraint(equalToConstant: 45),
        emailTxtField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20),
        emailTxtField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -20)])
    }
    
    private func passwordTextFieldConstraints() {
        NSLayoutConstraint.activate([
        passwordTxtField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        passwordTxtField.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor,constant: 100),
        passwordTxtField.heightAnchor.constraint(equalToConstant: 45),
        passwordTxtField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20),
        passwordTxtField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -20)])
    }
    
    private func enterButtonConstraints() {
        NSLayoutConstraint.activate([
        signInButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        signInButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 175),
        signInButton.heightAnchor.constraint(equalToConstant: 80),
        signInButton.widthAnchor.constraint(equalToConstant: 80)])
    }
    
    private func createAcctButtonConstraints() {
        NSLayoutConstraint.activate([
            createNewAcctButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            createNewAcctButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)])
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
