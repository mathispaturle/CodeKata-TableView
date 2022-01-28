//
//  02_Basic_Datasource.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 26/1/22.
//

import Foundation
import UIKit

final class Basic_02_Datasource: NSObject, UITableViewDataSource {
    private let tableView: UITableView
    private var viewModel: [String]?

    init(tableView: UITableView, viewModel: [String]?) {
        self.tableView = tableView
        self.viewModel = viewModel
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel?[indexPath.row]
        return cell
    }
}
