//  UpLoadImageVC.swift
//  Pursuitstgram-Firebase-Project
//  Created by Eric Widjaja on 11/25/19.
//  Copyright © 2019 Eric.W. All rights reserved.

import UIKit
import Photos

class UpLoadImageVC: UIViewController {
    
//MARK: - Properties
    var uploadImage = UpLoadImageView()
    
    var image = UIImage() {
        didSet {
            uploadImage.uploadImageView.image = image
        }
    }
    var imageURL: String? = nil
    
    private func setUploadImageView() {
        view.addSubview(uploadImage)
        view.backgroundColor = .lightGray
    }

//MARK: - Private Methods
    private func presentPhotoPickerController() {
        DispatchQueue.main.async{
            let imagePickerViewController = UIImagePickerController()
            imagePickerViewController.delegate = self
            imagePickerViewController.sourceType = .photoLibrary
            imagePickerViewController.allowsEditing = true
            imagePickerViewController.mediaTypes = ["public.image", "public.movie"]
            self.present(imagePickerViewController, animated: true, completion: nil)
        }
    }
    
    private func showAlert(with title: String, and message: String) {
    let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    present(alertVC, animated: true, completion: nil)
    }

//MARK: - Objc Func
    @objc func addButtonPressed() {
        switch PHPhotoLibrary.authorizationStatus() {
        case .notDetermined, .denied, .restricted:
            PHPhotoLibrary.requestAuthorization({[weak self] status in
                switch status {
                case .authorized:
                    self?.presentPhotoPickerController()
                case .denied:
                    print("Photo library access is denied")
                default:
                    print("No usable status")
                }
            })
        default:
            print("YES! the photoPickerController() IS working!")
            presentPhotoPickerController()
        }
    }
    
    @objc func uploadButtonPressed() {
        guard let user = FirebaseAuthService.manager.currentUser else {return}
        guard let photoUrl = imageURL else {return}
        FirestoreService.manager.createPost(post: Post(photoUrl: photoUrl, creatorID: user.uid)) { (result) in
            switch result {
            case .failure(let error):
                self.showAlert(with: "Unable to post", and: "Error: \(error)")
            case .success:
                self.showAlert(with: "Successful", and: "Posted the Image")
            }
        }
    }

//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUploadImageView()
        uploadImage.uploadButton.addTarget(self, action: #selector(uploadButtonPressed), for: .touchUpInside)
        uploadImage.uploadAddImageButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
    }
}

extension UpLoadImageVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            showAlert(with: "Error", and: "Couldn't get image")
            return
        }
        self.image = image
        
        guard let imageData = image.jpegData(compressionQuality: 1) else {
            showAlert(with: "Error", and: "could not compress image")
            return
        }
        
        FirebaseStorageService.uploadManager.storeImage(image: imageData, completion: { [weak self] (result) in
            switch result{
            case .success(let url):
                self?.imageURL = url
            case .failure(let error):
                print(error)
            }
        })
        dismiss(animated: true, completion: nil)
    }
}
