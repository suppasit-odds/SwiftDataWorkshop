//
//  Restuarant.swift
//  Gusto
//
//  Created by Suppasit chuwatsawat on 18/1/2567 BE.
//

import Foundation
import SwiftData

@Model
class Restuarant {
    // @Attribute(.unique) var name: String
    var name: String
    var price: Int
    var quality: Int
    var speedRating: Int
    var average: Double {
        Double(price + quality + speedRating) / 3.0
    }
    
    internal init(name: String, price: Int, quality: Int, speedRating: Int) {
        self.name = name
        self.price = price
        self.quality = quality
        self.speedRating = speedRating
    }
    
}
