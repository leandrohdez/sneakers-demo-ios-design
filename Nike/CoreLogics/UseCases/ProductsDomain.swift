//
//  ProductsDomain.swift
//  Nike
//
//  Created by Leandro Hernandez on 28/2/22.
//

import Foundation

class ProductsDomain {
    
    static let UseCases = ProductsDomain()
 
    //
    func sneakers(completion: @escaping (_ result: SneakersCaseResult) -> Void) {
        let useCase = SneakersUseCase()
        useCase.endHandle = { (resultCase) in
            if let result = resultCase as? SneakersCaseResult {
                completion(result)
            }
        }
        useCase.execute()
    }
    
    //
    func purchase(sneaker: Sneaker, completion: @escaping (_ result: PurchaseCaseResult) -> Void) {
        let useCase = PurchaseUseCase(sneaker: sneaker)
        useCase.endHandle = { (resultCase) in
            if let result = resultCase as? PurchaseCaseResult {
                completion(result)
            }
        }
        useCase.execute()
    }
    
}
