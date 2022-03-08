//
//  SneakersUseCase.swift
//  Nike
//
//  Created by Leandro Hernandez on 28/2/22.
//

import Foundation

enum SneakersCaseResult {
    case success(sneakers: [Sneaker])
    case unknownError
}

class SneakersUseCase: BaseUseCase {
    
    override init() {
        
    }
    
    override func execute() {
        super.execute()
        self.fetchSneackers()
    }
    
}

extension SneakersUseCase {
    
    //
    private func fetchSneackers() {
        
        var resultSneakers: [Sneaker] = []
        
        DispatchQueue.main.async {

            resultSneakers.append(Sneaker(name: "Nike Air Max 270", price: "135", image: "nike-air-max-270-red", colors: [.black, .red, .orange]))
            resultSneakers.append(Sneaker(name: "Nike Air Max 270", price: "140", image: "nike-air-max-270-black", colors: [.black, .orange]))
            resultSneakers.append(Sneaker(name: "Nike Air Max 270", price: "138", image: "nike-air-max-270-green", colors: [.black, .green]))
            resultSneakers.append(Sneaker(name: "Nike Air Force One", price: "120", image: "air-force-1", colors: [.black, .orange]))
            resultSneakers.append(Sneaker(name: "Nike Air Jordan 11", price: "111", image: "air-jordan-11", colors: [.red]))
            resultSneakers.append(Sneaker(name: "Nike Air Max 90", price: "131", image: "air-max-90-air-max", colors: [.gray, .yellow, .red]))
            resultSneakers.append(Sneaker(name: "Nike Air Max SC", price: "125", image: "air-max-sc", colors: [.white, .systemTeal, .black]))
            resultSneakers.append(Sneaker(name: "Nike Jordan Series 2", price: "120", image: "jordan-series-2-dear-dean", colors: [.white, .blue, .orange]))
            resultSneakers.append(Sneaker(name: "Nike Dunk Low", price: "115", image: "nike-dunk-low", colors: [.orange, .black]))
            resultSneakers.append(Sneaker(name: "Nike SB Zoom Blazzer", price: "108", image: "sb-zoom-blazer-mid", colors: [.systemPink, .blue]))

            self.finish(caseResult: SneakersCaseResult.success(sneakers: resultSneakers))
        }
    }
    
}
