//  LogInVC.swift
//  Pursuitstgram-Firebase-Project
//  Created by Eric Widjaja on 11/18/19.
//  Copyright © 2019 Eric.W. All rights reserved.


import UIKit
import FirebaseAuth

class LogInVC: UIViewController {
    
    var logInEmail: UITextField!
    var logInPassword: UITextField!
    var loginView = LogInView()
    
    
//MARK: @OBJC Functions
    @objc func signInButtonPressed() {
        let signInButton = loginView.signInButton
        guard let email = loginView.emailTxtField.text, !email.isEmpty,
            let password = loginView.passwordTxtField.text, !password.isEmpty
            else {
            showAlert(with: "Required", and: "Please enter both fields")
            return
        }
        FirebaseAuthService.manager.loginUser(email: email.lowercased(), password: password) { (result) in
            self.handleLoginResponse(with: result)
        }
    }
    
    @objc func displayForm(){
        let alert = UIAlertController(title: "Sign In", message: "Create an account", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel" , style: .cancel)
        
        let saveAction = UIAlertAction(title: "Submit", style: .default) { (action) -> Void in
            
            guard let email = self.logInEmail?.text, !email.isEmpty, let password = self.logInPassword?.text, !password.isEmpty else {
                self.showAlert(with: "Required", and: "Fill both fields")
                return
            }
            FirebaseAuthService.manager.createNewUser(email: email.lowercased(), password: password) { (result) in
                switch result {
                case .failure(let error):
                    self.showAlert(with: "Couldn't create user", and: "Error: \(error)")
                case .success(let newUser):
                    FirestoreService.manager.createAppUser(user: AppUser.init(from: newUser)) { (result) in
                        self.handleLoginResponse(with: result)
                    }
                }
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Enter email address"
            self.logInEmail = textField
        })
        
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Enter password"
            textField.isSecureTextEntry = true
            self.logInPassword = textField
        })
        
        self.present(alert, animated: true, completion: nil)
    }

//MARK: Functions
    private func showAlert(with title: String, and message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    //MARK: SignIn-handling
    private func handleCreateAccountResponse(with result: Result<User, Error>) {
        DispatchQueue.main.async { [weak self] in
            switch result {
            case .success(let user):
                FirestoreService.manager.createAppUser(user: AppUser(from: user)) { [weak self] newResult in
                    self?.handleCreatedUserInFirestore(result: newResult)
                }
            case .failure(let error):
                self?.showAlert(with: "Error creating user", and: "An error occured while creating new account \(error)")
            }
        }
    }
    
    private func handleCreatedUserInFirestore(result: Result<(), Error>) {
        switch result {
        case .success:
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
                else {
                    return
            }
            
            UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromBottom, animations: {
                if FirebaseAuthService.manager.currentUser?.photoURL != nil {
                    window.rootViewController = {
                        let profileSetupVC = FirebaseTabBarVC()
                            profileSetupVC.selectedIndex = 3
                        return profileSetupVC
                    }()
                } else {
                    window.rootViewController = {
                        let feedSetupVC = FirebaseTabBarVC()
                        feedSetupVC.selectedIndex = 0
                        return feedSetupVC
                    }()
                }
            }, completion: nil)
        case .failure(let error):
            self.showAlert(with: "Error creating user", and: "An error occured while creating new account \(error)")
        }
    }
    
    //MARK: Login-handling
    private func handleLoginResponse(with result: Result<(), Error>) {
        switch result {
        case .failure(let error):
            showAlert(with: "Error", and: "Could not log in. Error: \(error)")
        case .success:
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
                else {
                return
            }
            UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromBottom, animations: {
                if FirebaseAuthService.manager.currentUser?.photoURL != nil {
                    window.rootViewController = {
                    let profileSetupVC = FirebaseTabBarVC()
                        profileSetupVC.selectedIndex = 3
                    return profileSetupVC
                }()
                } else {
                    window.rootViewController = {
                        let feedSetupVC = FirebaseTabBarVC()
                        feedSetupVC.selectedIndex = 0
                        return feedSetupVC
                    }()
                }
            }, completion: nil)
        }
    }
    
    private func setLogInView() {
        view.addSubview(loginView)
        self.view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    }

//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        logInEmail?.delegate = self
        logInPassword?.delegate = self
        setLogInView()
        loginView.signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
    }
}

//MARK: - Extensions
extension LogInVC: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        loginView.passwordTxtField.clearsOnBeginEditing = true
        loginView.emailTxtField.clearsOnBeginEditing = true
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        logInPassword.resignFirstResponder()
        logInEmail.resignFirstResponder()
        return (true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

