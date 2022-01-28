//
//  SpotifyViewController.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 28/1/22.
//

import Foundation

import UIKit

class SpotifyViewController: UIViewController {
    
    // 1. Data structure
    private enum SpotifyCells {
        case header_welcome
        case most_played([MostPlayedModel])
        case new_release(ReleaseModel)
        case album_library(AlbumStructure)
    }
    
    // 2. Estructura para albergar las celdas de spotify
    // Nota: si tuviesemos shimmers podríamos poner los tipos .shimmer_cell en el empty array
    // de esa forma hasta que no se hiciese el reload aparecería 'cargando'
    private var spotifyCells: [SpotifyCells] = []
    
    // La master tableView
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hexString: "121212")
        navigationController?.navigationBar.isHidden = true
        
        setupTableView()
        setupConstraints()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension

        registerCells()
        retrieveData()
    }
    
    // 3. Registramos las celdas
    private func registerCells() {
        tableView.register(cellType: SYHeaderCell.self)
        tableView.register(cellType: SYMostPlayedCell.self)
        tableView.register(cellType: SYNewReleaseCell.self)
        tableView.register(cellType: SYSectionCell.self)
    }
    
    // 4. Recuperamos la información y manipulamos la estructura
    private func retrieveData() {
        
        let data = ServiceData.getData()
        
        spotifyCells.append(.header_welcome)
        spotifyCells.append(.most_played(data.mostPlayedData))
        spotifyCells.append(.new_release(data.releaseData))
        spotifyCells.append(.album_library(data.sectionOne))
        spotifyCells.append(.album_library(data.sectionTwo))

        tableView.reloadData()
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

extension SpotifyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spotifyCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch spotifyCells[indexPath.row] {
        case .album_library(let model):
            let cell: SYSectionCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            cell.configure(model: model)
            return cell
        case .header_welcome:
            let cell: SYHeaderCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            cell.configure()
            return cell
        case .most_played(let model):
            let cell: SYMostPlayedCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            cell.configure(model: model)
            return cell
        case .new_release(let model):
            let cell: SYNewReleaseCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            cell.configure(model: model)
            return cell
        }        
    }
}
