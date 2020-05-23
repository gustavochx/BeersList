//
//  BeerData.swift
//  BeerList
//
//  Created by Gustavo Henrique on 11/06/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import Combine
import SwiftUI

final class BeerData: ObservableObject {

    @Published var beers = [Beer]()
    
    init() {
        self.fetchBeers()
    }

    func fetchBeers() {
        PunkClient.shared.fetchBeers { result in
            switch result {
                
                case .failure(_):
                    break
                
                case .success(let response):
                    DispatchQueue.main.async {
                        self.beers = response
                }
            }
        }
    }

}

