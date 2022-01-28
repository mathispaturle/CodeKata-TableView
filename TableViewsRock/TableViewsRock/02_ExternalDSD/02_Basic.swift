//
//  02_ExternalDSD.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 26/1/22.
//

import Foundation
import UIKit

class Basics02: UIViewController {
    
    let data = ["Oscar", "Cane", "Iñigo", "Nacho", "Victor", "Alex", "Sergi", "Puto AF..."]
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    lazy var tableViewDataSource: Basic_02_Datasource = {
        return Basic_02_Datasource(tableView: tableView, viewModel: data)
    }()
    
    lazy var tableViewDelegate: Basic_02_Delegate = {
        return Basic_02_Delegate(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TableView External DSD"
        
        setupTableView()
        setupConstraints()
    }
    private func setupTableView() {
        view.addSubview(tableView)

        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    public func tapActionViewData(indexPath: IndexPath) {
        print("Hello \(data[indexPath.row])")
    }
}
