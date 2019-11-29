//
//  FeedCellCV.swift
//  Pursuitstgram-Firebase-Project
//
//  Created by Eric Widjaja on 11/25/19.
//  Copyright © 2019 Eric.W. All rights reserved.
//

import UIKit

class FeedCellCV: UICollectionViewCell {
    
    var feedImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 160))
        image.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        label.layer.borderWidth = 4
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    
    func setImageConstraints() {
        contentView.addSubview(feedImage)
        feedImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            feedImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            feedImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            feedImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            feedImage.widthAnchor.constraint(equalToConstant: feedImage.frame.width),
            feedImage.heightAnchor.constraint(equalToConstant: feedImage.frame.height)])
    }
    func setNameConstraints() {
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: feedImage.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: feedImage.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: feedImage.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)])
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImageConstraints()
        setNameConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

