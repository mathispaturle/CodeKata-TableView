//
//  ViewController.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 26/1/22.
//

import UIKit

class ViewController: UIViewController {

    var sectionTitles = ["Base Table View", "Table View External Delegate Datasource", "Custom Cell Table View", "Complex Structures", "Real Case Scenario Table View"]
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstraints()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()        
        cell.textLabel?.text = sectionTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Code Kata - Table Views"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var view: UIViewController?
        
        switch indexPath.row {
        case 0:
            view = Basics01()
        case 1:
            view = Basics02()
        case 2:
            view = Basics03()
        case 3:
            view = Basics04()
        case 4:
            view = SpotifyViewController()
        default:
            break
        }
        
        if let view = view {
            self.navigationController?.pushViewController(view, animated: true)
        }
        
    }
}
