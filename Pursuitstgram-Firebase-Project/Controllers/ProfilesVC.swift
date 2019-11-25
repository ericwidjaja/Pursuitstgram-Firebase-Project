//
//  ProfilesVC.swift
//  Pursuitstgram-Firebase-Project
//
//  Created by Eric Widjaja on 11/25/19.
//  Copyright © 2019 Eric.W. All rights reserved.
//

import UIKit

class ProfilesVC: UIViewController {

//MARK: - Properties
        
    var profilesView = ProfileView()
    
    var image = UIImage() {
        didSet {
            profilesView.userImage.image = image
        }
    }

    var imageURL: String? = nil
    var postCount = 0 {
        didSet {
            profilesView.imageSubmissionLabel.text = "You have submitted \(postCount) images"
        }
    }
        var displayNameTextBox: UITextField?


//MARK: - Setup Method
    private func setupEmailLabel() {
        if let email = FirebaseAuthService.manager.currentUser?.email {
            profilesView.emailLabel.text = "\(email)"
        }
    }

//MARK: - Private Methods
    private func showAlert(with title: String, and message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }

    private func setDefaultName() {
        if let displayName = FirebaseAuthService.manager.currentUser?.displayName {
            profilesView.nameLabel.text = displayName
        }
    }

    private func setDefaultImage() {
        if let pictureUrl = FirebaseAuthService.manager.currentUser?.photoURL {
            FirebaseStorageService.profileManager.getUserImage(photoUrl: pictureUrl) { (result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let image):
                    self.profilesView.userImage.image = image
                }
            }
        }
    }

    private func getPostCount() {
        if let userUID = FirebaseAuthService.manager.currentUser?.uid {
            DispatchQueue.global(qos: .default).async {
                FirestoreService.manager.getPosts(forUserID: userUID) { (result) in
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let posts):
                        self.postCount = posts.count
                    }
                }
            }
        }
    }

    private func updateUserNameField(newDisplayName: String) {
        guard let userUID = FirebaseAuthService.manager.currentUser?.uid else {
            return
        }
        FirestoreService.manager.updateAppUser(id: userUID, newDisplayName: newDisplayName) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success:
                print("updated users in FireStore")
            }
        }
    }

    //MARK: - Objc Functions
    @objc func displayForm(){
        //create alert
        let alert = UIAlertController(title: "Edit Display Name?", message: nil, preferredStyle: .alert)

        //create cancel button
        let cancelAction = UIAlertAction(title: "Cancel" , style: .cancel)

        //create save button
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action) -> Void in

            guard let newName = self.displayNameTextBox?.text, !newName.isEmpty else {
                self.showAlert(with: "Required", and: "Fill both fields")
                return
            }

            FirebaseAuthService.manager.updateUserFields(userName: newName) { (result) in
                switch result {
                case .success:
                    self.showAlert(with: "Display Name Changed!", and: "successful!")
                    profilesView.nameLabel.text = newName
                    self.updateUserNameField(newDisplayName: newName)
                case .failure(let error):
                    print(error)
                }
            }
        }

        alert.addAction(cancelAction)
        alert.addAction(saveAction)

        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Enter New Display Name"
            self.displayNameTextBox = textField
        })
        self.present(alert, animated: true, completion: nil)
    }
    @objc func presentPhotoPickerController() {
        DispatchQueue.main.async{
            let imagePickerViewController = UIImagePickerController()
            imagePickerViewController.delegate = self
            imagePickerViewController.sourceType = .photoLibrary
            imagePickerViewController.allowsEditing = true
            imagePickerViewController.mediaTypes = ["public.image", "public.movie"]
            self.present(imagePickerViewController, animated: true, completion: nil)
        }
    }
    
    private func setProfilesView() {
        view.addSubview(profilesView)
        self.view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfilesView()
        profilesView.editButton.addTarget(self, action: #selector(displayForm), for: .touchUpInside)
    }

   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDefaultName()
        setDefaultImage()
        getPostCount()
    }
}

extension ProfilesVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            //MARK: TODO - handle couldn't get image :(
            showAlert(with: "Error", and: "Couldn't get image")
            return
        }
        self.image = image
        
        guard let imageData = image.jpegData(compressionQuality: 1) else {
            //MARK: TODO - gracefully fail out without interrupting UX
            showAlert(with: "Error", and: "could not compress image")
            return
        }
        
        FirebaseStorageService.profileManager.storeImage(image: imageData, completion: { [weak self] (result) in
            switch result{
            case .success(let url):
                self?.imageURL = url
                FirebaseAuthService.manager.updateUserFields(userName: nil, photoURL: url) { (_) in
                }
            case .failure(let error):
                print(error)
            }
        })
        dismiss(animated: true, completion: nil)
    }
}
