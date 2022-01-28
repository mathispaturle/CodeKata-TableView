//
//  SYLCVCell.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 28/1/22.
//

import Foundation
import UIKit

class SYLCVCell: UICollectionViewCell, ReusableCell {
    
    private enum Constants {
        static let lateralMargin: CGFloat = 16
        static let interMargin: CGFloat = 16
    }
    
    let containerView: UIView = {
        let cv = UIView(frame: .zero)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear

        return cv
    }()
    
    let imageCover: UIImageView = {
        let img = UIImageView(frame: .zero)
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2

        return lbl
    }()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupView() {
        contentView.addSubview(containerView)
        containerView.addSubview(imageCover)
        containerView.addSubview(nameLabel)
    }
    
    private func setupStyles() {
        nameLabel.textColor = .systemGray5
        nameLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func configure(model: AlbumData) {
        setupView()
        setupConstraints()
        setupStyles()
        
        imageCover.image = UIImage(named: model.imageName)
        nameLabel.text = model.detail
    }
    
    private func setupConstraints() {
        
        let width: CGFloat = (UIScreen.main.bounds.width / 3)
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: width * 1.4),
            containerView.widthAnchor.constraint(equalToConstant: width),
            
            imageCover.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageCover.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageCover.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageCover.heightAnchor.constraint(equalTo: containerView.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: imageCover.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: imageCover.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: imageCover.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -4)
        ])
    }
}
