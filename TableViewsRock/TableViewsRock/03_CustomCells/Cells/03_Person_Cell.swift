//
//  03_Person_Cell.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 27/1/22.
//

import Foundation
import UIKit

class Person_Cell_03: UITableViewCell, ReusableCell {
    
    let containerView: UIView = {
        let cv = UIView(frame: .zero)
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
    
    let subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0

        return lbl
    }()
    
    let pic: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false

        return img
    }()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Setup View
extension Person_Cell_03 {
    
    private func setupView() {
        addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(pic)
    }
    
    private func setupStyles() {
        DispatchQueue.main.async {
            self.containerView.layer.shadowPath = UIBezierPath(rect: self.containerView.bounds).cgPath
            self.containerView.layer.shadowRadius = 5
            self.containerView.layer.shadowOffset = .zero
            self.containerView.layer.shadowOpacity = 0.05

            self.nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
            self.nameLabel.textColor = .black

            self.subtitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
            self.subtitleLabel.textColor = .systemGray

            self.pic.layer.cornerRadius = self.pic.frame.size.height * 0.5
            self.pic.clipsToBounds = true
            
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    func configure(model: Person) {
        
        setupView()
        setupConstraints()
        setupStyles()

        nameLabel.text = model.name
        subtitleLabel.text = model.position
        pic.image = UIImage(named: model.pic)
        

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            pic.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            pic.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            pic.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            pic.widthAnchor.constraint(equalToConstant: 80),
            pic.heightAnchor.constraint(equalToConstant: 80),

            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: pic.trailingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -32),
            
            subtitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)

        ])
    }
}
