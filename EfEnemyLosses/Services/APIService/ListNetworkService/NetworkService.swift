//
//  NetworkService.swift
//  EfEnemyLosses
//
//  Created by user on 27.08.2023.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    
    init() {
    }
    
    func getList<T: Decodable>(for url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(object))
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }.resume()
    }
}

//enum NetworkError: Error {
//    case unknownError
//    case connectionError
//    case invalidCredentials
//    case invalidRequest
//    case notFound
//    case notEmployeeId
//    case notAnnualType
//    case invalidResponse
//    case serverError
//    case serverUnavailable
//    case timeOut
//    case unsuppotedURL
//    case noData
//}
//
