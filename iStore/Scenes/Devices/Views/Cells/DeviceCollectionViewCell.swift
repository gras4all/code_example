//
//  DeviceCollectionViewCell.swift
//  iStore
//
//  Created by Andrey Grunenkov on 06.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

import UIKit
import Kingfisher

final class DeviceCollectionViewCell: UICollectionViewCell {
    
    var device: Device? {
        didSet {
            guard let device = device else { return }
            let url = URL(string: device.url)
            iconImageView.kf.setImage(with: url)
            modelNameLabel.text = device.name
            priceLabel.text = device.price
        }
    }
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.turnOffAutoresizingMask()
        return imageView
    }()

    private let modelNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        label.numberOfLines = 0
        label.turnOffAutoresizingMask()
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .blue
        label.turnOffAutoresizingMask()
        return label
    }()
    
    private let overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
        view.alpha = 0
        view.turnOffAutoresizingMask()
        view.roundCornersWithRadius(20, shadowEnabled: false)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.15) {
                self.overlayView.alpha = self.isHighlighted ? 1 : 0
            }
        }
    }
}

// MARK: - private methods
private extension DeviceCollectionViewCell {
    
    func setupViews() {
        backgroundColor = .white
        roundCornersWithRadius(20)
    }
    
    func setupConstraints() {
        
        // Make layout with constraints
        
        contentView.addSubviews(iconImageView, priceLabel, modelNameLabel, overlayView)
        
        let constraints = [iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
         iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
         iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
         iconImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
         
         modelNameLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8),
         modelNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
         modelNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
         
         priceLabel.topAnchor.constraint(equalTo: modelNameLabel.bottomAnchor, constant: 8),
         priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
         priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
         priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
         
         overlayView.topAnchor.constraint(equalTo: contentView.topAnchor),
         overlayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
         overlayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
         overlayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
