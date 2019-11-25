//
//  FeedVC.swift
//  Pursuitstgram-Firebase-Project
//
//  Created by Eric Widjaja on 11/25/19.
//  Copyright © 2019 Eric.W. All rights reserved.
//


import UIKit

class FeedVC: UIViewController {

//MARK: - Properties
    
    var feedView = FeedView()
    
    private func setFeedView() {
        view.addSubview(feedView)
        view.backgroundColor = #colorLiteral(red: 0.09828350693, green: 0.01108088437, blue: 0.4048976898, alpha: 1)
    }

//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setFeedView()

    }
}

