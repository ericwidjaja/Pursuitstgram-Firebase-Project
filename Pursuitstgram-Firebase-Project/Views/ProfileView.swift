// ProfileView.swift
//  Pursuitstgram-Firebase-Project
//
//  Created by Eric Widjaja on 11/25/19.
//  Copyright © 2019 Eric.W. All rights reserved.

import UIKit

class ProfileView: UIView {

//MARK: -Objects
    var profileLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.text = "Profile"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.text = "Display Name"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "example@email.com"
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    var userImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "noImage")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var imageSubmissionLabel: UILabel = {
        let label = UILabel()
        label.text = "You have not submitted any images"
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()

    var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add"), for: .normal)
//        button.addTarget(self, action: #selector(presentPhotoPickerController), for: .touchUpInside)
        return button
    }()
    
    var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.systemTeal, for: .normal)
//        button.addTarget(self, action: #selector(displayForm), for: .touchUpInside)
        return button
    }()
    
//MARK: - Constraints
    private func profileConstraints() {
        profileLabelConstraints()
        imageConstraints()
        nameConstraints()
        editButtonConstraints()
        emailLabelConstraints()
        submissionConstraints()
        addButtonConstraints()
//        emailLabel()
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
            profileLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 50),
            profileLabel.heightAnchor.constraint(equalToConstant: 70),
            profileLabel.widthAnchor.constraint(equalToConstant: 200)])
    }
    private func imageConstraints() {
        NSLayoutConstraint.activate([
            userImage.centerXAnchor.constraint(equalTo: profileLabel.centerXAnchor),
            userImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            userImage.widthAnchor.constraint(equalToConstant: 200),
            userImage.heightAnchor.constraint(equalToConstant: 200)])
    }
    private func nameConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor,constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo:safeAreaLayoutGuide.trailingAnchor,constant: -20)])
    }
    private func editButtonConstraints() {
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            editButton.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor)])
    }
    private func emailLabelConstraints() {
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 50),
            emailLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)])
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
  
}
