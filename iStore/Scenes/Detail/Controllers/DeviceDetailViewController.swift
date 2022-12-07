//
//  DeviceDetailViewController.swift
//  iStore
//
//  Created by Andrey Grunenkov on 06.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

import UIKit
import Kingfisher

final class DeviceDetailViewController: UIViewController {
    
    var addToCartTapped: ((Device) -> Void)?
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let scrollView = UIScrollView()

    private let modelNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .systemBlue
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 18)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add To Cart", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = buttonHeight/2
        button.layer.masksToBounds = true
        return button
    }()
    
    private let device: Device
    
    // MARK: - Life cycle
    
    init(device: Device) {
        self.device = device
        super.init(nibName: nil, bundle: nil)
        updateDevice()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        makeLayout()
    }
    
}

// MARK: - Private methods
private extension DeviceDetailViewController {
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubviews(iconImageView, modelNameLabel, priceLabel, descriptionLabel, addToCartButton)
        addToCartButton.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
    }
    
    func updateDevice() {
        let url = URL(string: device.url)
        iconImageView.kf.setImage(with: url)
        modelNameLabel.attributedText = TextFormatter.titleText(with: device.name)
        descriptionLabel.attributedText = TextFormatter.descriptionText(with: device.description)
        priceLabel.attributedText = TextFormatter.priceText(with: device.price)
        title = device.name
    }
    
    func makeLayout() {
        
        // Make layout with frames
        
        let imageWidth: CGFloat = view.bounds.width - 32 * 2
        let baseWidth: CGFloat = view.bounds.width - 32 * 2
        let modelLabelInset: CGFloat = 32
        let descriptionLabelInset: CGFloat = 24
        let priceLabelInset: CGFloat = 32
        let bottomInset: CGFloat = 24
        let modelNameHeight: CGFloat = modelNameLabel.attributedText?.height(widthLimit: baseWidth) ?? 0
        let descriptionHeight: CGFloat = descriptionLabel.attributedText?.height(widthLimit: baseWidth) ?? 0
        let priceHeight: CGFloat = priceLabel.attributedText?.height(widthLimit: baseWidth) ?? 0
        
        scrollView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.bounds.width,
            height: view.bounds.height
        )
        
        iconImageView.frame = CGRect(
            x: 32,
            y: view.safeAreaInsets.top,
            width: imageWidth,
            height: imageWidth
        )
    
        modelNameLabel.frame = CGRect(
            x: (view.bounds.width - baseWidth) / 2,
            y: iconImageView.frame.maxY + modelLabelInset,
            width: baseWidth,
            height: modelNameHeight
        )
        
        descriptionLabel.frame = CGRect(
            x: 32,
            y: modelNameLabel.frame.maxY + descriptionLabelInset,
            width: baseWidth,
            height: descriptionHeight
        )
        
        priceLabel.frame = CGRect(
            x: 32,
            y: descriptionLabel.frame.maxY + priceLabelInset,
            width: baseWidth,
            height: priceHeight
        )
        
        addToCartButton.frame = CGRect(
            x: (view.bounds.width - buttonWidth) / 2,
            y: priceLabel.frame.maxY,
            width: buttonWidth,
            height: buttonHeight
        )
        
        let contentSizeHeight: CGFloat = imageWidth + modelLabelInset + modelNameHeight + descriptionLabelInset + descriptionHeight + priceLabelInset + priceHeight + buttonHeight + bottomInset + 66
        
        scrollView.contentSize = CGSize(width: view.bounds.width, height: contentSizeHeight)
    }
    
    @objc private func addToCartButtonTapped() {
        addToCartTapped?(device)
    }
    
}

extension DeviceDetailViewController {
    
    var buttonHeight: CGFloat { return 44 }
    var buttonWidth: CGFloat { return 140 }
    
}
