//
//  BoxViewModel.swift
//  Nike
//
//  Created by Leandro Hernandez on 7/3/22.
//

import Foundation
import SwiftUI

class BoxViewModel: ObservableObject {
    
    @Published var sneaker: Sneaker
    
    //
    init(sneaker: Sneaker) {
        self.sneaker = sneaker
    }
    
    func executePurchase() {
        ProductsDomain.UseCases.purchase(sneaker: self.sneaker) { result in
            switch result {
            case .success:
                // done
                break
            case .unknownError:
                // fail
                break
            }
        }
    }
    
}
