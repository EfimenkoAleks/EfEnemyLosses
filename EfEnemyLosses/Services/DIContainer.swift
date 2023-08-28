//
//  DIContainer.swift
//  EfEnemyLosses
//
//  Created by user on 27.08.2023.
//

import Foundation

struct DIContainer {

    static var `default` = Self()
    
    lazy var listService: ListFecherProtocol = ListFecher()
}
