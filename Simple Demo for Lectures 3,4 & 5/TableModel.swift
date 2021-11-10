//
//  TableModel.swift
//  Demo
//
//  Created by Arteezy on 11/7/21.
//

import Foundation
import UIKit

enum albumRating {
    case good
    case great
    case wow
}

struct TableModel {
    var albumName: String
    var songCount: Int
    var artistName: String
    var releaseDate: Int
    var isFav: Bool = false
    var rating: albumRating
    

    func convertRatingToString(_ rating: albumRating) -> String {
        switch rating {
            case .good:
                return "good"
            case .great:
                return "great"
            case .wow:
                return "wow"
            }
    }
    
}
