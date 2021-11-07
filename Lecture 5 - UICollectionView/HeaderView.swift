//
//  HeaderView.swift
//  L5Starter
//
//  Created by Arteezy on 11/7/21.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
    }
    
    func configure(for sectionName: String) {
        label.text = sectionName
    }
    
    func SetUpConstraints(){
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
        
}
