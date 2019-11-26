//
//  UpLoadImageVC.swift
//  Pursuitstgram-Firebase-Project
//
//  Created by Eric Widjaja on 11/25/19.
//  Copyright © 2019 Eric.W. All rights reserved.
//

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
                    print("need to write photoPickerController")
//                    self?.presentPhotoPickerController()
                case .denied:
                    print("Denied photo library permissions")
                default:
                    print("No usable status")
                }
            })
        default:
            print("need to write func photoPickerController()")
            //presentPhotoPickerController()
        }
    }
    @objc func uploadButtonPressed() {
        guard let user = FirebaseAuthService.manager.currentUser else {return}
        guard let photoUrl = imageURL else {return}
        FirestoreService.manager.createPost(post: Post(photoUrl: photoUrl, creatorID: user.uid)) { (result) in
            switch result {
            case .failure(let error):
                self.showAlert(with: "Unable to make post", and: "Error: \(error)")
            case .success:
                self.showAlert(with: "Successful", and: "Post created")
            }
        }
    }

//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUploadImageView()
        uploadImage.uploadButton.addTarget(self, action: #selector(uploadButtonPressed), for: .touchUpInside)
        uploadImage.uploadAddButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
    }
}
