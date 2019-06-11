//
//  BeerResponse.swift
//  BeerList
//
//  Created by Gustavo Henrique on 11/06/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import SwiftUI

struct BeerResponse : Hashable, Decodable {
    var beers: [Beer]
}

