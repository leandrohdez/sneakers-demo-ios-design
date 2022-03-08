//
//  PurchaseUseCase.swift
//  Nike
//
//  Created by Leandro Hernandez on 7/3/22.
//

import Foundation

enum PurchaseCaseResult {
    case success
    case unknownError
}

class PurchaseUseCase: BaseUseCase {
    
    private let sneaker: Sneaker
    
    init(sneaker: Sneaker) {
        self.sneaker = sneaker
    }
    
    override func execute() {
        super.execute()
        self.serviceExecutePurchase()
    }
    
}

extension PurchaseUseCase {
    
    //
    private func serviceExecutePurchase() {
        // simulate delay conexion api
        // use sneaker object to send required params to api
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.finish(caseResult: PurchaseCaseResult.success)
        }
    }
    
}
