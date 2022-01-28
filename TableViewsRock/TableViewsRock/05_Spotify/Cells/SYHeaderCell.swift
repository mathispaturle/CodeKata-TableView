//
//  SYHeaderCell.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 28/1/22.
//

import Foundation
import UIKit

class SYHeaderCell: UITableViewCell, ReusableCell {
    
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
    
    let button1: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false

        return btn
    }()
    
    let button2: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false

        return btn
    }()
    
    let button3: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false

        return btn
    }()
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Setup View
extension SYHeaderCell {
    
    private func setupView() {
        addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(button1)
        containerView.addSubview(button2)
        containerView.addSubview(button3)
    }
    
    private func setupStyles() {
        backgroundColor = .clear
        containerView.backgroundColor = .clear

        nameLabel.font = .systemFont(ofSize: 22, weight: .bold)
        nameLabel.textColor = .white
        nameLabel.text = "Good evening"
        
        
        button1.setImage(UIImage(systemName: "bell"), for: .normal)
        button2.setImage(UIImage(systemName: "clock.arrow.circlepath"), for: .normal)
        button3.setImage(UIImage(systemName: "gearshape"), for: .normal)

        button1.tintColor = .white
        button2.tintColor = .white
        button3.tintColor = .white
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func configure() {
        setupView()
        setupConstraints()
        setupStyles()
    }
    
    private func setupConstraints() {
        
        let buttonDim: CGFloat = 28
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            nameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            
            button3.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            button3.heightAnchor.constraint(equalToConstant: buttonDim),
            button3.widthAnchor.constraint(equalToConstant: buttonDim),
            button3.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            button2.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            button2.heightAnchor.constraint(equalToConstant: buttonDim),
            button2.widthAnchor.constraint(equalToConstant: buttonDim),
            button2.trailingAnchor.constraint(equalTo: button3.leadingAnchor, constant: -16),
            
            button1.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            button1.heightAnchor.constraint(equalToConstant: buttonDim),
            button1.widthAnchor.constraint(equalToConstant: buttonDim),
            button1.trailingAnchor.constraint(equalTo: button2.leadingAnchor, constant: -16),

        ])
    }
}
