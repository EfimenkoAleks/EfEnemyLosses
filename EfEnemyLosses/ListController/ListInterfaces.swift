//
//  ListInterfaces.swift
//  EfEnemyLosses
//
//  Created by user on 26.08.2023.
//

import Foundation

protocol ListViewModelProtocol {
    var fetchList: (([Equipment]) -> Void)? {get set}
}
