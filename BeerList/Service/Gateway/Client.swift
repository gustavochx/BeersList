//
//  Client.swift
//  BeerList
//
//  Created by Gustavo Henrique on 11/06/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import Foundation

enum APIError: Error {

    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    case unauthorized

    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        case .unauthorized: return "Unauthorized"
        }
    }
}

protocol Client {
    var session: URLSession { get }
    func fetch<T:Decodable> (using request: URLRequest, decode: @escaping(Decodable) -> T? , completionHandler: @escaping(Result<T, APIError>) -> Void)
}

extension Client {

    typealias JSONTaskCompletionHandler = (Decodable?, APIError?) -> Void
    typealias JSONEmptyCompletionHandler = (APIError?) -> Void
    typealias HttpResponseCompletionHandler = (HTTPURLResponse?, Data?, APIError?) -> Void

    func fetch<T:Decodable>(using request: URLRequest, decode: @escaping(Decodable) -> T?, completionHandler: @escaping(Result<T, APIError>) -> Void) {

        let task = decodingTask(with: request, decodingType: T.self) { json, error in

            guard let json = json else {
                if let error = error {

                    completionHandler(Result.failure(error))
                } else {
                    completionHandler(Result.failure(.invalidData))
                }
                return
            }

            if let data = decode(json) {
                completionHandler(Result.success(data))
            } else {
                completionHandler(Result.failure(.jsonParsingFailure))
            }
        }
        task.resume()

    }

    func fetchWithoutDecodable(using request: URLRequest, completionHandler: @escaping HttpResponseCompletionHandler) {

        let task = taskWithoutDecode(with: request) { (response, data, error) in
            completionHandler(response, data, error)
        }
        task.resume()
    }



    func decodingTask <T:Decodable>
        (with request: URLRequest, decodingType : T.Type,
         completionHandler completion: @escaping JSONTaskCompletionHandler ) -> URLSessionDataTask {

        let task = session.dataTask(with: request) { data, response, erro in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }

            if httpResponse.statusCode == 200 || httpResponse.statusCode == 201 {
                if let data = data {
                    do{

                        let genericModel = try JSONDecoder().decode(decodingType, from: data)
                        completion(genericModel,nil)

                    } catch {


                        completion(nil, .jsonParsingFailure)

                    }
                } else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .invalidData)
            }
        }
        return task
    }

    func taskWithoutDecode(with request: URLRequest, completionHandler completion: @escaping  HttpResponseCompletionHandler) -> URLSessionDataTask {

        let task = session.dataTask(with: request) { data, response, _ in

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, nil, .requestFailed)
                return
            }

            if httpResponse.statusCode == 200 {
                completion(httpResponse, data, nil)

            } else if httpResponse.statusCode == 401 {
                completion(nil, nil, .unauthorized)
            } else {
                completion(nil, nil, .responseUnsuccessful)
            }
        }

        return task
    }



}
