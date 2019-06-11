//
//  Beer.swift
//  BeerList
//
//  Created by Gustavo Henrique on 11/06/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit
import SwiftUI

struct Beer: Hashable, Decodable, Identifiable {

    var id: Int64
    var name: String
    var description: String
    var image_url: URL

}

extension Beer {

    static var fake: Beer {
        Beer(id: 1, name: "Buzz", description: "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.", image_url: URL(fileURLWithPath: "https://images.punkapi.com/v2/keg.png"))
    }
}
