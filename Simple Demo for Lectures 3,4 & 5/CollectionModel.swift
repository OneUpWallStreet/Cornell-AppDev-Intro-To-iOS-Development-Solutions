//
//  CollectionModel.swift
//  Demo_2
//
//  Created by Arteezy on 11/10/21.
//

import Foundation
import UIKit

class CollectionModel {
    
    var imageName: String
    var isSelected: Bool
    
    
    init(imageName: String){
        self.imageName = imageName
        self.isSelected = false
    }
    
    func getImage() -> UIImage {
        let imageName = isSelected ? "5" : imageName
        guard let image = UIImage(named: imageName) else {return UIImage()}
        return image
    }
    
    
}
