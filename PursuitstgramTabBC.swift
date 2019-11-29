//  PursuitstgramTabBC.swift
//  Pursuitstgram-Firebase-Project
//  Created by Eric Widjaja on 11/25/19.
//  Copyright © 2019 Eric.W. All rights reserved.
//

import UIKit

class PursuitstgramTabBC: UITabBarController {
    
    lazy var feedVC = UINavigationController(rootViewController: FeedVC())
    
    lazy var uploadVC = UINavigationController(rootViewController: UpLoadImageVC())
    
    lazy var profileVC: UINavigationController = {
        
        let userProfileVC = ProfilesVC()
        return UINavigationController(rootViewController: userProfileVC)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: #imageLiteral(resourceName: "FeedGallery"), tag: 0)
        uploadVC.tabBarItem = UITabBarItem(title: "Upload", image: UIImage(systemName: "square.and.arrow.up.on.square"), tag: 1)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.2.fill"), tag: 2)
        self.viewControllers = [feedVC, uploadVC,profileVC]
    }
}
