//
//  SYMostPlayedCell.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 28/1/22.
//

import Foundation
import UIKit

class SYMostPlayedCell: UITableViewCell, ReusableCell {
    
    private enum Constants {
        static let lateralMargin: CGFloat = 16
        static let interMargin: CGFloat = 8
    }
    
    private var mostPlayed: [MostPlayedModel] = []
    
    let collectionView: UICollectionView = {
        let width: CGFloat = (UIScreen.main.bounds.width * 0.5) - Constants.lateralMargin - (Constants.interMargin * 0.5)

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: Constants.lateralMargin, bottom: 0, right: Constants.lateralMargin)
        layout.itemSize = CGSize(width: width, height: 65)
        layout.minimumLineSpacing = Constants.interMargin
        layout.minimumInteritemSpacing = Constants.interMargin
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white

        return cv
    }()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Setup View
extension SYMostPlayedCell {
    
    private func setupView() {
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        
        collectionView.register(cellType: SYMPCVCell.self)
    }
    
    private func setupStyles() {
        backgroundColor = .clear
        collectionView.backgroundColor = .clear
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func configure(model: [MostPlayedModel]) {
        mostPlayed = model
        setupView()
        setupConstraints()
        setupStyles()
        
        collectionView.reloadData()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: (65 * 3) + (2 * Constants.interMargin)),
        ])
    }
}


extension SYMostPlayedCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mostPlayed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SYMPCVCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(model: mostPlayed[indexPath.row])
        return cell
    }
    
    
}
