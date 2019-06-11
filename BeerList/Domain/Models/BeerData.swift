//
//  BeerData.swift
//  BeerList
//
//  Created by Gustavo Henrique on 11/06/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import Combine
import SwiftUI


final class BeerData: BindableObject {

    var didChange = PassthroughSubject<BeerData,Never>()

    private(set) var beers = [Beer]() {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(self)
            }
        }
    }

    init() {
        self.fetchBeers()
    }

    func fetchBeers() {
        PunkClient.shared.fetchBeers { result in
            switch result {
                case .failure(_):
                    break

                case .success(let response):
                    self.beers = response
            }
        }
    }

}

