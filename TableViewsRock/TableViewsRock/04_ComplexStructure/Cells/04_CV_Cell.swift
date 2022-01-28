//
//  03_Person_Cell.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 27/1/22.
//

import Foundation
import UIKit

class CV_Cell_04: UITableViewCell, ReusableCell {
    
    let collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white

        return cv
    }()

    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Setup View
extension CV_Cell_04 {
    
    private func setupView() {
        addSubview(collectionView)
    }
    
    private func setupStyles() {
        
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(cellType: Color_04_Cell.self)
        collectionView.isScrollEnabled = true
        collectionView.alwaysBounceVertical = false
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.contentInset = UIEdgeInsets(top: -10, left: 0, bottom:0, right: 0)

        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            layout.itemSize = CGSize(width: 100, height: 100)
            layout.invalidateLayout()
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    
    }
    
    func configure() {
        setupView()
        setupConstraints()
        setupStyles()
//        Timer.scheduledTimer(timeInterval: TimeInterval(CGFloat.random() + 0.5), target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    
    
    @objc func scrollAutomatically(_ timer1: Timer) {

        for cell in collectionView.visibleCells {
            if let indexPath = collectionView.indexPath(for: cell){
                if indexPath.row < 25 * 25 {
                    let indexPath1 = IndexPath.init(row: indexPath.row + 1, section: indexPath.section)
                    collectionView.scrollToItem(at: indexPath1, at: .right, animated: true)
                } else {
                    let indexPath1 = IndexPath.init(row: 0, section: indexPath.section)
                    collectionView.scrollToItem(at: indexPath1, at: .left, animated: true)
                }
            }
        }
    }
}

extension CV_Cell_04: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: Color_04_Cell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure()
        return cell
    }
}
