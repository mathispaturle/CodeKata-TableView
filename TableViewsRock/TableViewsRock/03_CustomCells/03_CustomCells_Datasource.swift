//
//  03_CustomCells_Datasource.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 26/1/22.
//

import Foundation
import UIKit

final class Basic_03_Datasource: NSObject, UITableViewDataSource {
    private let tableView: UITableView
    private var viewModel: [Person]?

    init(tableView: UITableView, viewModel: [Person]?) {
        self.tableView = tableView
        self.viewModel = viewModel
    }
    
    public func registerCells() {
        tableView.register(cellType: Person_Cell_03.self)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Person_Cell_03 = tableView.dequeueReusableCell(for: indexPath)
                
        cell.selectionStyle = .none
        cell.clipsToBounds = false
        
        if let model = viewModel {
            cell.configure(model: model[indexPath.row])
        }
        return cell
    }
}
