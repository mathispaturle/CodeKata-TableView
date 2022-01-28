//
//  03_CustomCells.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 26/1/22.
//

import Foundation
import UIKit

class Basics04: UIViewController {
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Complex structures"
        
        setupTableView()
        setupConstraints()
    }
    private func setupTableView() {
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 100
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = UITableView.automaticDimension

        tableView.register(cellType: CV_Cell_04.self)
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

extension Basics04: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 35
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CV_Cell_04 = tableView.dequeueReusableCell(for: indexPath)
        cell.configure()
        return cell
    }
    
    
}
