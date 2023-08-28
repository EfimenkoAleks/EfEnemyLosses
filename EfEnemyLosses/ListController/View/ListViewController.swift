//
//  ListViewController.swift
//  EfEnemyLosses
//
//  Created by user on 26.08.2023.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    lazy var viewModel: ListViewModelProtocol = {
        let viewModel = ListViewModel()
        return viewModel
    }()
    private var tableViewManager: ListTableViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindUI()
    }
    
    func bindUI() {
        title = "List"
        navigationController?.navigationBar.prefersLargeTitles = true
    
        viewModel.fetchList = { [unowned self] newList in
            DispatchQueue.main.async {
                self.setupTable(newList)
            }
        }
    }
    
    func setupTable(_ data: [Equipment]) {
        self.tableViewManager = ListTableViewManager(tableView, data: data)
        self.tableViewManager?.eventHandler = { [unowned self] event in
            self.navigationController?.pushViewController(DetailViewController(), animated: true)
        }
    }
}
