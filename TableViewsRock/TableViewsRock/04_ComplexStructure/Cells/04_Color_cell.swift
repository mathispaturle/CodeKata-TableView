//
//  04_Color_cell.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 27/1/22.
//

import Foundation
import UIKit

class Color_04_Cell: UICollectionViewCell, ReusableCell {
    let containerView: UIView = {
        let cv = UIView(frame: .zero)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white

        return cv
    }()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupView() {
        contentView.addSubview(containerView)
    }
    
    private func setupStyles() {
        DispatchQueue.main.async {
            self.containerView.backgroundColor = .random()
            
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    func configure() {
        setupView()
        setupConstraints()
        setupStyles()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 100),
            containerView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
