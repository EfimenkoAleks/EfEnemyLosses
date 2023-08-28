//
//  ListFecherProtocol.swift
//  EfEnemyLosses
//
//  Created by user on 27.08.2023.
//

import Foundation

protocol ListFecherProtocol {
    func getList(completion: @escaping ([Equipment]) -> Void)
}
