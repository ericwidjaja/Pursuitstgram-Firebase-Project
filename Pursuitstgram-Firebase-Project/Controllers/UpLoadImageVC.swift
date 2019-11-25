//
//  UpLoadImageVC.swift
//  Pursuitstgram-Firebase-Project
//
//  Created by Eric Widjaja on 11/25/19.
//  Copyright © 2019 Eric.W. All rights reserved.
//

import UIKit

class UpLoadImageVC: UIViewController {
    
//MARK: Properties
    var uploadImage = UpLoadImageView()
    
    private func setUploadImageView() {
        view.addSubview(uploadImage)
        view.backgroundColor = .black
    }

//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUploadImageView()

    }
}
