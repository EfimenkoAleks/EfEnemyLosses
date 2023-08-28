//
//  ListTableViewManager.swift
//  EfEnemyLosses
//
//  Created by user on 26.08.2023.
//

import UIKit

enum ListEvent {
    case reload
    case selectedVideo(Equipment)
}

class ListTableViewManager: NSObject {
    
    private var isLoadingList: Bool = false
    
    var tableView: UITableView
    var data: [Equipment]
    var eventHandler: ((ListEvent) -> Void)?
    
    init(_ tableView: UITableView, data: [Equipment]) {
        self.tableView = tableView
        self.data = data
        super.init()
        
        registerTableViewCells()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    func reloadTable(data: [Equipment]) {
        self.data = data
        tableView.reloadData()
    }
}

extension ListTableViewManager {
    
    func registerTableViewCells() {
        tableView.register(ListTableViewCell.nib, forCellReuseIdentifier: ConstantId.listCell)
    }
}

extension ListTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConstantId.listCell, for: indexPath)
                as? ListTableViewCell else { return UITableViewCell() }
        
        let model = data[indexPath.row]
        
        cell.configure(model: model)
        return cell
    }
}

extension ListTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if eventHandler != nil {
            eventHandler?(.selectedVideo(data[indexPath.row]))
        }
    }
}

