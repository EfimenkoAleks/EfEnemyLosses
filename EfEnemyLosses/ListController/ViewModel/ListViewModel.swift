//
//  ListViewModel.swift
//  EfEnemyLosses
//
//  Created by user on 26.08.2023.
//

import Foundation

class ListViewModel {
    
    var fetchList: (([Equipment]) -> Void)?
    private var _fetcher: ListFecherProtocol
    
    init(fetcher: ListFecherProtocol = DIContainer.default.listService) {
        self._fetcher = fetcher
        
        fechData()
    }
    
    private func fechData() {
        _fetcher.getList { [unowned self] rezult in
            self.fetchList?(rezult)
        }
    }
}

extension ListViewModel: ListViewModelProtocol {}
