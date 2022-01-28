//
//  SYMPCVCell.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 28/1/22.
//

import Foundation
import UIKit

class SYMPCVCell: UICollectionViewCell, ReusableCell {
    
    private enum Constants {
        static let lateralMargin: CGFloat = 16
        static let interMargin: CGFloat = 8
    }
    
    let containerView: UIView = {
        let cv = UIView(frame: .zero)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor(hexString: "292929")

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
        lbl.numberOfLines = 0

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
        
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 14, weight: .bold)
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func configure(model: MostPlayedModel) {
        setupView()
        setupConstraints()
        setupStyles()
        
        imageCover.image = UIImage(named: model.imageName)
        nameLabel.text = model.headerName
    }
    
    private func setupConstraints() {
        
        let width: CGFloat = (UIScreen.main.bounds.width * 0.5) - Constants.lateralMargin - (Constants.interMargin * 0.5)
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: 65),
            containerView.widthAnchor.constraint(equalToConstant: width),
            
            imageCover.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageCover.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageCover.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            imageCover.widthAnchor.constraint(equalTo: containerView.heightAnchor),
            
            nameLabel.centerYAnchor.constraint(equalTo: imageCover.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: imageCover.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)

        ])
    }
}
