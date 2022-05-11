//
//  PunkClient.swift
//  BeerList
//
//  Created by Gustavo Henrique on 11/06/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import Foundation

final class PunkClient: Client {

    static let shared: PunkClient = PunkClient()
    let session: URLSession

    init(_ configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init () {
        self.init(.default)
    }

    func fetchBeers(completionHandler: @escaping (Result<[BeersResponse]?,APIError>) -> Void) {
        fetch(using: PunkEndpoint.getBeers.get,
              decode: { (responseObject) -> [BeersResponse]? in
            guard let jsonObject = responseObject as? [BeersResponse] else {
                return nil
            }
            return jsonObject
        }, completionHandler: completionHandler)
    }
}
