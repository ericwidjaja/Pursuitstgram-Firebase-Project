// LogIn.swift
//  Pursuitstgram-Firebase-Project
//  Created by Eric Widjaja on 11/23/19.
//  Copyright © 2019 Eric.W. All rights reserved.


import UIKit
import FirebaseAuth


class LogInView: UIView {

//MARK: - Objects
    lazy var projectTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = " P U R S U I T S T G R A M "
        label.font = UIFont(name: "Noteworthy-Bold", size: 32)
        label.textColor = UIColor.white
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    
    var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "InstagramOldLogo")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var emailTxtField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "enter email here"
        textField.font = UIFont(name: "Noteworthy", size: 18)
        textField.backgroundColor = .white
        textField.borderStyle = .bezel
        textField.autocorrectionType = .no
        return textField
    }()
    var passwordTxtField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "enter your password"
        textField.font = UIFont(name: "Noteworthy", size: 18)
        textField.backgroundColor = .white
        textField.borderStyle = .bezel
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitle("SIGN IN", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: 20)
        return button
    }()
    
    var createNewAcctButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Create a New Account?       ",attributes: [
            NSAttributedString.Key.font: UIFont(name: "Noteworthy", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign Up!",
                                                  attributes: [NSAttributedString.Key.font: UIFont(name: "Noteworthy-Bold", size: 20)!,
                                                               
                                NSAttributedString.Key.foregroundColor:  UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    lazy var objectsViewArray = [self.projectTitle, self.logoImageView, self.emailTxtField, self.passwordTxtField, self.signInButton, self.createNewAcctButton]
    
    
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
        logoImgConstraints()
        emailTextFieldConstraints()
        passwordTextFieldConstraints()
        enterButtonConstraints()
        createAcctButtonConstraints()
    }
    
    private func titleConstraints() {
        NSLayoutConstraint.activate([
        projectTitle.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        projectTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 70),
        projectTitle.heightAnchor.constraint(equalToConstant: 120), projectTitle.widthAnchor.constraint(equalToConstant: 400)])
    }
    
    private func logoImgConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 160),
            logoImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 180),
            logoImageView.heightAnchor.constraint(equalToConstant: 180)])
    }

    private func emailTextFieldConstraints() {
        NSLayoutConstraint.activate([
        emailTxtField.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor,constant: 25),
        emailTxtField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        emailTxtField.heightAnchor.constraint(equalToConstant: 45),
        emailTxtField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20),
        emailTxtField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -20)])
    }
    
    private func passwordTextFieldConstraints() {
        NSLayoutConstraint.activate([
        passwordTxtField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        passwordTxtField.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor,constant: 85),
        passwordTxtField.heightAnchor.constraint(equalToConstant: 45),
        passwordTxtField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20),
        passwordTxtField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -20)])
    }
    
    private func enterButtonConstraints() {
        NSLayoutConstraint.activate([
        signInButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        signInButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 160),
        signInButton.heightAnchor.constraint(equalToConstant: 70),
        signInButton.widthAnchor.constraint(equalToConstant: 130)])
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
