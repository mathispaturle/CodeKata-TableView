//
//  SYNewReleaseCell.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 28/1/22.
//

import Foundation
import UIKit

class SYNewReleaseCell: UITableViewCell, ReusableCell {
    
    private enum Constants {
        static let lateralMargin: CGFloat = 16
        static let interMargin: CGFloat = 8
    }
    
    let containerView: UIView = {
        let cv = UIView(frame: .zero)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        
        return cv
    }()
    
    
    // TOP OF CARD
    let imageArtist: UIImageView = {
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
    
    let detailLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0

        return lbl
    }()
    
    // CARD INFO
    let cardView: UIView = {
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
    
    let songName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0

        return lbl
    }()
    
    let songDescription: UILabel = {
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
        containerView.addSubview(imageArtist)
        containerView.addSubview(nameLabel)
        containerView.addSubview(detailLabel)
        
        containerView.addSubview(cardView)
        cardView.addSubview(imageCover)
        cardView.addSubview(songName)
        cardView.addSubview(songDescription)
    }
    
    private func setupStyles() {
        
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        imageArtist.layer.cornerRadius = 32.5
        imageArtist.clipsToBounds = true
        
        detailLabel.textColor = .systemGray4
        detailLabel.font = .systemFont(ofSize: 10, weight: .regular)
        
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        
        
        cardView.layer.cornerRadius = 8
        cardView.clipsToBounds = true
        
        
        songName.textColor = .white
        songName.font = .systemFont(ofSize: 14, weight: .bold)
        
        songDescription.textColor = .systemGray4
        songDescription.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    func configure(model: ReleaseModel) {
        setupView()
        setupStyles()
        setupConstraints()

        imageArtist.image = UIImage(named: model.artistImageName)
        nameLabel.text = model.artistName
        detailLabel.text = "New release from".uppercased()
        
        imageCover.image = UIImage(named: model.coverImageName)
        songName.text = model.songTitle
        songDescription.text = model.moreInfo
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imageArtist.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            imageArtist.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            imageArtist.widthAnchor.constraint(equalToConstant: 65),
            imageArtist.heightAnchor.constraint(equalToConstant: 65),
            
            detailLabel.topAnchor.constraint(equalTo: imageArtist.topAnchor, constant: 10),
            detailLabel.leadingAnchor.constraint(equalTo: imageArtist.trailingAnchor, constant: 8),
            
            nameLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 1),
            nameLabel.leadingAnchor.constraint(equalTo: detailLabel.leadingAnchor),
            
            cardView.topAnchor.constraint(equalTo: imageArtist.bottomAnchor, constant: 8),
            cardView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            cardView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            cardView.heightAnchor.constraint(equalToConstant: 164),
            
            imageCover.topAnchor.constraint(equalTo: cardView.topAnchor),
            imageCover.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            imageCover.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            imageCover.widthAnchor.constraint(equalTo: cardView.heightAnchor),

            songName.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 64),
            songName.leadingAnchor.constraint(equalTo: imageCover.trailingAnchor, constant: 16),

            songDescription.topAnchor.constraint(equalTo: songName.bottomAnchor, constant: 4),
            songDescription.leadingAnchor.constraint(equalTo: songName.leadingAnchor),
        ])
    }
}
