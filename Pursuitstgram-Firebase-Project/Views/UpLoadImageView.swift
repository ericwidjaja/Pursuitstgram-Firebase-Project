//
//  UpLoadImageView.swift
//  Pursuitstgram-Firebase-Project
//
//  Created by Eric Widjaja on 11/25/19.
//  Copyright © 2019 Eric.W. All rights reserved.
//

import UIKit

class UpLoadImageView: UIView {

//MARK: - Objects
  var uploadLabel: UILabel = {
        let label = UILabel()
    label.font = UIFont.init(name: "Noteworthy-Bold", size: 35)
        label.text = "Upload Image"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var uploadImageView: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "ImagePlaceHolder")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var uploadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Upload", for: .normal)
        button.setTitleColor(.systemTeal, for: .normal)
        return button
    }()
    
    lazy var feedViewArray = [self.uploadLabel, self.uploadImageView, self.uploadButton]
    
    
//MARK:Add ViewsToSubviews
    func addViewsToSubView() {
        for aView in feedViewArray {
            self.addSubview(aView)
            aView.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    //MARK: - Constraints
    private func upLoadConstraints() {
        addViewsToSubView()
        uploadLabelConstraints()
        uploadImgConstraints()
        uploadButtonConstraints()
    }
    private func uploadLabelConstraints() {
        NSLayoutConstraint.activate([
            uploadLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            uploadLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            uploadLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15)])
    }
    private func uploadImgConstraints() {
        NSLayoutConstraint.activate([
            uploadImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            uploadImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            uploadImageView.widthAnchor.constraint(equalToConstant: 250),
            uploadImageView.heightAnchor.constraint(equalToConstant: 250)])
    }
    private func uploadButtonConstraints() {
        NSLayoutConstraint.activate([
            uploadButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -150),
            uploadButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)])
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        upLoadConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
