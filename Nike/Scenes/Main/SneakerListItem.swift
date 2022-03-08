//
//  SneakerListItem.swift
//  Nike
//
//  Created by Leandro Hernandez on 7/3/22.
//

import Foundation

extension MainView {
    
    struct SneakerListItem: Identifiable {
        
        var id: UUID
        
        var sneaker: Sneaker
        
        init(_ sneaker: Sneaker) {
            self.id = sneaker.id
            self.sneaker = sneaker
        }
    }
    
}
