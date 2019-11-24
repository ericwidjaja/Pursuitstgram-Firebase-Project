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
    
    lazy var objectsViewArray = [self.projectTitle, self.emailTxtField, self.passwordTxtField]
    
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
//        emailTextFieldConstraints()
//        passwordTextFieldConstraints()
    }
    
    private func titleConstraints() {
        addSubview(projectTitle)
        NSLayoutConstraint.activate([
        projectTitle.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        projectTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 60),
        projectTitle.heightAnchor.constraint(equalToConstant: 70), projectTitle.widthAnchor.constraint(equalToConstant: 350)])
    }
    
//    private func emailTextFieldConstraints() {
//        emailTxtField.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            emailTxtField.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor,constant: 120),
//            emailTxtField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
//            emailTxtField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20),
//            emailTxtField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -20)])
//    }
//    private func passwordTextFieldConstraints() {
//        passwordTxtField.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            passwordTxtField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
//            passwordTxtField.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor,constant: 150),
//            passwordTxtField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20),
//            passwordTxtField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -20)])
//    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
