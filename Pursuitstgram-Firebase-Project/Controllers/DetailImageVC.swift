//
//  DetailImageVC.swift
//  Pursuitstgram-Firebase-Project
//
//  Created by Eric Widjaja on 11/25/19.
//  Copyright © 2019 Eric.W. All rights reserved.
//

import UIKit

class DetailImageVC: UIViewController {
    
//MARK: - Properties
    var post: Post?
    
//MARK: - UI Objects
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var detailImage: UIImageView!
    
    
    
    @IBOutlet weak var submissionLabel: UILabel!
    
    @IBOutlet weak var createdLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        getSelectedImage()
        getSetUserName()
        getDate()

    }
    
    
//MARK: - Private Functions
    private func getSelectedImage() {
        if let photoUrl = post?.photoUrl {
            FirebaseStorageService.uploadManager.getImage(url: photoUrl) { (result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let firebaseImage):
                    self.detailImage.image = firebaseImage
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
                    self.submissionLabel.text = "Submitted by: \(displayName)"
                }
            }
        }
    }
    
    private func getDate() {
        guard let post = post, let date = post.dateCreated else {return}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let strDate = dateFormatter.string(from: date)
        createdLabel.text = "Created at: \(strDate)"
    }
}
