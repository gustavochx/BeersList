//
//  PunkEndpoint.swift
//  BeerList
//
//  Created by Gustavo Henrique on 11/06/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import Foundation

enum PunkEndpoint {
    case getBeers
}

extension PunkEndpoint: Endpoint {
    var baseUrl: String {
        return "https://api.punkapi.com/"
    }

    var path: String {
        switch self {
        case .getBeers:
            return "/v2/beers"
        }
    }
}
