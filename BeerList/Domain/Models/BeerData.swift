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

    @Published var beers: [Beer]
    
    init() {
        beers = []
        fetchBeers()
    }

    func fetchBeers() {
        PunkClient.shared.fetchBeers { [weak self] result in
            if case let .success(response) = result {
                self?.beers = self?.map(from: response) ?? []
            }
        }
    }

    private func map(from beersResponse: [BeersResponse]?) -> [Beer]? {
        beersResponse?.compactMap {
            Beer(id: $0.id,
                 name: $0.name,
                 description: $0.description,
                 imageUrl: $0.imageUrl)
        }
    }
}
