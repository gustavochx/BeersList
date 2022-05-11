//
//  BeersResponse.swift
//  BeerList
//
//  Created by Gustavo Henrique Frota Soares on 22/05/20.
//  Copyright © 2020 Gustavo Henrique. All rights reserved.
//

import UIKit

struct BeersResponse: Decodable {
    let id: Int
    let name: String
    let description: String
    let imageUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case imageUrl = "image_url"
    }
}
