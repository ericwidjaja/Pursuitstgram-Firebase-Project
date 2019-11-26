// ProfileView.swift
//  Pursuitstgram-Firebase-Project
//
//  Created by Eric Widjaja on 11/25/19.
//  Copyright © 2019 Eric.W. All rights reserved.

import UIKit

class ProfileView: UIView {

//MARK: - Objects
    var profileLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "Noteworthy-Bold", size: 40)
        label.text = "User Profile"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "Noteworthy-Bold", size: 40)
        label.text = "Profile Name"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "youremail@email.com"
        label.font = UIFont.init(name: "Noteworthy", size: 22)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var userImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "InstaProfileIMG")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var imageSubmissionLabel: UILabel = {
        let label = UILabel()
        label.text = "You have NOT submitted any images"
        label.font = UIFont.init(name: "Noteworthy", size: 22)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add"), for: .normal)
        return button
    }()
    
    var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit your profile?", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        return button
    }()
    
//MARK: - Constraints
    func profileConstraints() {
        addViewsToSubView()
        profileLabelConstraints()
        imageConstraints()
        nameConstraints()
        editButtonConstraints()
        emailLabelConstraints()
        submissionConstraints()
        addButtonConstraints()
    }

    lazy var profileObjectsViewArray = [self.profileLabel, self.nameLabel, self.emailLabel, self.userImage, self.imageSubmissionLabel, self.addButton, self.editButton]
    
    
    //MARK:Add ViewsToSubviews
    func addViewsToSubView() {
        for aView in profileObjectsViewArray {
            self.addSubview(aView)
            aView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    private func profileLabelConstraints() {
        NSLayoutConstraint.activate([
            profileLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            profileLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 60),
            profileLabel.heightAnchor.constraint(equalToConstant: 80),
            profileLabel.widthAnchor.constraint(equalToConstant: 300)])
    }
    private func imageConstraints() {
        NSLayoutConstraint.activate([
            userImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            userImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            userImage.widthAnchor.constraint(equalToConstant: 150),
            userImage.heightAnchor.constraint(equalToConstant: 175)])
    }
    private func nameConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor,constant: 45),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo:safeAreaLayoutGuide.trailingAnchor,constant: -10)])
    }
    private func editButtonConstraints() {
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            editButton.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
            editButton.widthAnchor.constraint(equalToConstant: 180)])
    }
    private func emailLabelConstraints() {
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 25),
            emailLabel.centerXAnchor.constraint(equalTo: editButton.centerXAnchor),
            emailLabel.widthAnchor.constraint(equalToConstant: 250)])
    }
    private func submissionConstraints() {
        NSLayoutConstraint.activate([
            imageSubmissionLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            imageSubmissionLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            imageSubmissionLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor)])
    }
    private func addButtonConstraints() {
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: userImage.topAnchor),
            addButton.trailingAnchor.constraint(equalTo: userImage.trailingAnchor,constant: 30),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.widthAnchor.constraint(equalToConstant: 50)])
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        profileConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
