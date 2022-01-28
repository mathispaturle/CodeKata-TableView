//
//  01_Basics.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 26/1/22.
//

import Foundation
import UIKit

class Basics01: UIViewController {
    
    // Declaramos nuestra tableView
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Base TableView"
        
        // Añadimos la tableView a ala vista
        view.addSubview(tableView)

        // Asignamos delegate y datasource al viewController Basic01
        tableView.delegate = self
        tableView.dataSource = self
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension Basics01: UITableViewDelegate, UITableViewDataSource {
    
    // Numero de secciones que tendrá nuestra tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    // Numero de filas que tendrá cada sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    // Vista que tendrá cada fila en funcion del indexPath (combo sección, fila)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Info: section => \(indexPath.section), row => \(indexPath.row)"
        return cell
    }
    
    // Evento que se ejecuta si la fila es pulsada
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header title: section => \(section)"
    }
}
