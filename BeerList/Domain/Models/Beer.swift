//
//  Beer.swift
//  BeerList
//
//  Created by Gustavo Henrique on 11/06/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit
import SwiftUI

struct Beer: Hashable, Identifiable {

    let id: Int
    let name: String
    let description: String
    let imageUrl: String
    
    func getUrl() -> URL {
        URL(string: self.imageUrl)!
    }
}

extension Beer {
    static var fixture: Beer {
        Beer(id: 1,
             name: "Buzz",
             description: "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.",
             imageUrl: "https://images.punkapi.com/v2/keg.png")
    }
}
