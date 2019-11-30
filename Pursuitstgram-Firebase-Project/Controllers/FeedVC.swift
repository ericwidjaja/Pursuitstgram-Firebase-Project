//  FeedVC.swift
//  Pursuitstgram-Firebase-Project
//
//  Created by Eric Widjaja on 11/25/19.
//  Copyright © 2019 Eric.W. All rights reserved.

import UIKit

class FeedVC: UIViewController {

//MARK: - Properties
    var feedView = FeedView()
    var feedCell = FeedCellCV()
    var postImages = [Post]() {
        didSet {
            feedView.feedCollectionView.reloadData()
        }
    }
//MARK: - Objc Functions
    
    @objc func navigateToStoryboardDetailImageVC() {
        //look for the specific storyboard that has the VC in it
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //in that storyboard, look for the VC that I'm going to create that instance of
        let divc = storyboard.instantiateViewController(identifier: "DetailImageVC") as! DetailImageVC
        //push that VC onto the navigation controller
        self.navigationController?.pushViewController(divc, animated: true)
    }
    

//MARK: - Private Functions
    private func getPosts() {
        FirestoreService.manager.getAllPosts(sortingCriteria: nil) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let postsFromFirebase):
                DispatchQueue.main.async {
                    self.postImages = postsFromFirebase
                }
            }
        }
    }
    private func setFeedView() {
        view.addSubview(feedView)
        feedView.feedCollectionView.delegate = self
        feedView.feedCollectionView.dataSource = self
        view.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
    }

//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        setFeedView()
        getPosts()
   }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPosts()
    }
}

//MARK: CollectionViewDelegates
extension FeedVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        postImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCell", for: indexPath) as? FeedCellCV else {
            return UICollectionViewCell()
        }
        let post = postImages[indexPath.row]
        DispatchQueue.main.async {
            if let photoUrl = post.photoUrl {
                FirebaseStorageService.uploadManager.getImage(url: photoUrl) { (result) in
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let firebaseImage):
                        cell.feedImage.image = firebaseImage
                    }
                }
                FirestoreService.manager.getUserNameFromPost(creatorID: post.creatorID) { (result) in
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let displayName):
                        cell.nameLabel.text = displayName
                    }
                }
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedPost = postImages[indexPath.row]
        let imageDetailVC = DetailImageVC()
        imageDetailVC.post = selectedPost
        self.navigationController?.pushViewController(imageDetailVC, animated: true)
        print("to detVC")
    }
}
