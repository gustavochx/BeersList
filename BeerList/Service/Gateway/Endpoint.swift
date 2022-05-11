//
//  Endpoint.swift
//  BeerList
//
//  Created by Gustavo Henrique on 11/06/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
}

extension Endpoint {

    var urlComponents: URLComponents{
        var components = URLComponents(string: baseUrl)!
        components.path = path
        return components
    }

    var queryItems: [URLQueryItem] {
        return urlComponents.queryItems!
    }

    var get : URLRequest {
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }

    var post : URLRequest {
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "POST"
        return urlRequest
    }

    var postMultipart : URLRequest {
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "POST"
        return urlRequest
    }

    var postUrlEncoded: URLRequest {
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        return request
    }
}
