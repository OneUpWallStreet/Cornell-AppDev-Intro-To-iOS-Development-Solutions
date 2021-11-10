//
//  CustomCollectionViewCell.swift
//  Demo_2
//
//  Created by Arteezy on 11/10/21.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var albumImage: UIImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        albumImage.contentMode = .scaleAspectFit
        albumImage.layer.borderWidth = 1
        albumImage.layer.borderColor = UIColor.black.cgColor
        albumImage.layer.cornerRadius = 5
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(albumImage)
        SetUpConstraints()
    }
    
    func SetUpConstraints() {
        NSLayoutConstraint.activate([
            albumImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            albumImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            albumImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            albumImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    func configure(albumImageData: CollectionModel) {
        albumImage.image = albumImageData.getImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
