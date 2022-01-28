//
//  03_CustomCells.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 26/1/22.
//

import Foundation
import UIKit

class Basics03: UIViewController {
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    lazy var tableViewDataSource: Basic_03_Datasource = {
        return Basic_03_Datasource(tableView: tableView, viewModel: DummyData_03.getPersons())
    }()
    
    lazy var tableViewDelegate: Basic_03_Delegate = {
        return Basic_03_Delegate(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TableView Custom Cells"
        
        setupTableView()
        setupConstraints()
    }
    private func setupTableView() {
        view.addSubview(tableView)

        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = UITableView.automaticDimension

        tableViewDataSource.registerCells()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
