//  FeedView.swift
//  Pursuitstgram-Firebase-Project
//  Created by Eric Widjaja on 11/25/19.
//  Copyright © 2019 Eric.W. All rights reserved.

import UIKit

class FeedView: UIView {
    
    var feedCell = FeedCellCV()

//MARK: - Objects
    var feedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "Noteworthy-Bold", size: 40)
        label.text = "F E E D"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var feedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.register(FeedCellCV.self, forCellWithReuseIdentifier: "feedCell")
        return collection
    }()
    
    lazy var feedViewArray = [self.feedLabel, self.feedCollectionView]
    
//MARK:Add ViewsToSubviews
    func addViewsToSubView() {
        for aView in feedViewArray {
            self.addSubview(aView)
            aView.translatesAutoresizingMaskIntoConstraints = false
        }
    }

//MARK: - Constraints
    func feedConstraints() {
        addViewsToSubView()
        feedLabelConstraints()
        collectionViewConstraints()
    }
    private func feedLabelConstraints() {
        NSLayoutConstraint.activate([
            feedLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            feedLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 40),
            feedLabel.heightAnchor.constraint(equalToConstant: 60),
            feedLabel.widthAnchor.constraint(equalToConstant: 150)])
    }
    private func collectionViewConstraints() {
        NSLayoutConstraint.activate([
            feedCollectionView.topAnchor.constraint(equalTo: feedLabel.bottomAnchor, constant: 40),
            feedCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            feedCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            feedCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        feedConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
