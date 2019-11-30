//  DetailImageVC.swift
//  Pursuitstgram-Firebase-Project
//  Created by Eric Widjaja on 11/25/19.
//  Copyright © 2019 Eric.W. All rights reserved.

import UIKit

class DetailImageVC: UIViewController {
    //MARK: - Properties
    
    var post: Post?
    var detailPost = DetailImageView()

    //MARK: - Private Methods
    private func setDetailImageView() {
        view.addSubview(detailPost)
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private func getSetImage() {
        if let photoUrl = post?.photoUrl {
            FirebaseStorageService.uploadManager.getImage(url: photoUrl) { (result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let firebaseImage):
                    self.detailPost.detailSelectedImage.image = firebaseImage
                }
            }
        }
    }
    private func getSetUserName() {
        if let post = post {
            FirestoreService.manager.getUserNameFromPost(creatorID: post.creatorID) { (result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let displayName):
                    self.detailPost.detailSubmissionLabel.text = "Submitted by: \(displayName)"
                }
            }
        }
    }
    private func getDate() {
        guard let post = post, let date = post.dateCreated else {return}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let strDate = dateFormatter.string(from: date)
        self.detailPost.detailCreatedLabel.text = "Created at: \(strDate)"
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.black
        setDetailImageView()
        getSetImage()
        getSetUserName()
        getDate()
    }
}
