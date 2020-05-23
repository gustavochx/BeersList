//
//  BeersResponse.swift
//  BeerList
//
//  Created by Gustavo Henrique Frota Soares on 22/05/20.
//  Copyright © 2020 Gustavo Henrique. All rights reserved.
//

import UIKit

class BeersResponse: Decodable {
    
    var id: Int64
    var name: String
    var description: String
    var image_url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case image_url = "image_url"
    }
    
}
