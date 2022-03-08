//
//  BaseUseCase.swift
//  Nike
//
//  Created by Leandro Hernandez on 28/2/22.
//

import Foundation

class BaseUseCase {
    
    var beginHandle: (() -> Void)?
    
    var endHandle: ((_ result: UseCaseResult) -> Void)?
    
    func execute() {
        self.beginHandle?()
    }
    
    func finish(caseResult: UseCaseResult) {
        self.endHandle?(caseResult)
    }
}
