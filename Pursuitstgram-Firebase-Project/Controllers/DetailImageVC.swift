//
//  DetailImageVC.swift
//  Pursuitstgram-Firebase-Project
//
//  Created by Eric Widjaja on 11/25/19.
//  Copyright © 2019 Eric.W. All rights reserved.
//

import UIKit

class DetailImageVC: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var detailImage: UIImageView!
    
    
    
    @IBOutlet weak var submissionLabel: UILabel!
    
    @IBOutlet weak var createdLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray

    }
    
}
