//
//  MainViewModel.swift
//  Nike
//
//  Created by Leandro Hernandez on 6/3/22.
//

import SwiftUI
import UIKit

class MainViewModel: ObservableObject {
    
    @Published var newCollection: [MainView.SneakerListItem]
    
    @Published var lifestyles: [MainView.SneakerListItem]
    
    //
    init() {
        self.newCollection = []
        self.lifestyles = []
    }
    
    //
    func fetchSneakers() {
        
        self.newCollection = []
        
        ProductsDomain.UseCases.sneakers { result in
        
            switch result {
                
            case .success(let sneakers):
                
                // first 3 items
                if sneakers.count >= 3 {
                    self.newCollection = sneakers[0..<3].enumerated().map {
                        return MainView.SneakerListItem($1)
                    }
                }
                
                self.lifestyles = sneakers[3..<sneakers.count].enumerated().map {
                    return MainView.SneakerListItem($1)
                }
                
            case .unknownError:
                print("Error")
            }
        }
    }
    
}
