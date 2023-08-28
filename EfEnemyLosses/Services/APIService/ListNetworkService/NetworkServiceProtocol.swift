//
//  NetworkServiceProtocol.swift
//  EfEnemyLosses
//
//  Created by user on 27.08.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getList<T: Decodable>(for url: URL, completion: @escaping (Result<T, Error>) -> Void)
}
