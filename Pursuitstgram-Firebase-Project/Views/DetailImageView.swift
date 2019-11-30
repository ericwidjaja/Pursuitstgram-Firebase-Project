//
//  DetailImageView.swift
//  Pursuitstgram-Firebase-Project
//
//  Created by Eric Widjaja on 11/29/19.
//  Copyright © 2019 Eric.W. All rights reserved.
//

import UIKit

class DetailImageView: UIView {

//MARK: - Objects

    lazy var detailTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "Noteworthy-Bold", size: 34)
        label.text = "POST  IMAGE  DETAIL"
        label.textAlignment = .center
        return label
    }()

    lazy var detailSelectedImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "ImagePlaceHolder")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var detailSubmissionLabel: UILabel = {
        let label = UILabel()
        label.text = "Submitted by:"
        return label
    }()
    
    lazy var detailCreatedLabel: UILabel = {
        let label = UILabel()
        label.text = "Created at: MM/DD HH:MM"
        return label
    }()
    private func setLabels(){
        [detailTitleLabel, detailSubmissionLabel, detailCreatedLabel].forEach{$0?.textColor = .white}
        [detailSubmissionLabel, detailCreatedLabel].forEach{$0?.font = UIFont.init(name: "Noteworthy", size: 24)}
    }
    
//MARK: - Constraints
    func detailPostConstraints() {
        addViewsToSubView()
        setLabels()
        titleLabelConstraints()
        selectedImageConstraints()
        createdLabelConstraints()
        submissionLabelConstraints()
    }

    lazy var detailObjectsViewArray = [self.detailTitleLabel, self.detailSelectedImage, self.detailCreatedLabel, self.detailSubmissionLabel]
    
    
//MARK:Add ViewsToSubviews
    func addViewsToSubView() {
        for aView in detailObjectsViewArray {
            self.addSubview(aView)
            aView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    private func titleLabelConstraints() {
    NSLayoutConstraint.activate([
    detailTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
    detailTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
    detailTitleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)])
    }
    
    private func selectedImageConstraints() {
    NSLayoutConstraint.activate([
    detailSelectedImage.topAnchor.constraint(equalTo: detailTitleLabel.bottomAnchor,constant: 30),
    detailSelectedImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
    detailSelectedImage.widthAnchor.constraint(equalToConstant: bounds.width),
    detailSelectedImage.heightAnchor.constraint(equalToConstant: bounds.width)])
    }
    
    private func submissionLabelConstraints() {
    NSLayoutConstraint.activate([
    detailSubmissionLabel.topAnchor.constraint(equalTo: detailSelectedImage.bottomAnchor, constant: 30),
    detailSubmissionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
    detailSubmissionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)])
    }
    private func createdLabelConstraints() {
    NSLayoutConstraint.activate([
    detailCreatedLabel.topAnchor.constraint(equalTo: detailSubmissionLabel.bottomAnchor, constant: 20),
    detailCreatedLabel.leadingAnchor.constraint(equalTo: detailSubmissionLabel.leadingAnchor),
    detailCreatedLabel.trailingAnchor.constraint(equalTo: detailSubmissionLabel.trailingAnchor)])
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        detailPostConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
