//
//  Sneaker.swift
//  Nike
//
//  Created by Leandro Hernandez on 6/3/22.
//

import Foundation
import UIKit

class Sneaker: Equatable {
    
    var id: UUID
    
    var name: String
    
    var price: String
    
    var image: String
    
    var colors: [UIColor]
 
    //
    init(name: String, price: String, image: String, colors: [UIColor] = []) {
        self.id = UUID()
        self.name = name
        self.price = price
        self.image = image
        self.colors = colors
    }
    
    //
    static func == (lhs: Sneaker, rhs: Sneaker) -> Bool {
        return (lhs.id == rhs.id)
    }
}
