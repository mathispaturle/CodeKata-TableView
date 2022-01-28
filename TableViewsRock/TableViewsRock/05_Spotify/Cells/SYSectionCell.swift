//
//  SYSectionCell.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 28/1/22.
//

import Foundation
import UIKit

class SYSectionCell: UITableViewCell, ReusableCell {
    
    private enum Constants {
        static let lateralMargin: CGFloat = 16
        static let interMargin: CGFloat = 16
    }
    
    private var library: [AlbumData] = []
    
    let collectionView: UICollectionView = {
        let width: CGFloat = (UIScreen.main.bounds.width / 3)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: Constants.lateralMargin, bottom: 0, right: Constants.lateralMargin)
        layout.itemSize = CGSize(width: width, height: width * 1.4)
        layout.minimumLineSpacing = Constants.interMargin
        layout.minimumInteritemSpacing = Constants.interMargin
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white

        return cv
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0

        return lbl
    }()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Setup View
extension SYSectionCell {
    
    private func setupView() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        
        collectionView.register(cellType: SYLCVCell.self)
    }
    
    private func setupStyles() {
        backgroundColor = .clear
        collectionView.backgroundColor = .clear
        
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func configure(model: AlbumStructure) {
        nameLabel.text = model.title
        library = model.data
        setupView()
        setupConstraints()
        setupStyles()
        
        collectionView.reloadData()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            collectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: (65 * 3) + (2 * Constants.interMargin)),
        ])
    }
}


extension SYSectionCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return library.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SYLCVCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(model: library[indexPath.row])
        return cell
    }
    
    
}
