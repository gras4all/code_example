//
//  DeviceDetailViewController.swift
//  iStore
//
//  Created by Andrey Grunenkov on 27.05.2020.
//  Copyright © 2020 Andrey Grunenkov. All rights reserved.
//

import UIKit

protocol AddToCartButtonDelegate: AnyObject {
    func didTapAddToCartButton(_ device: Device)
}

final class DeviceDetailViewController: UIViewController {
    
    var onSelectDevice: ((Device) -> Void)?
    
    weak var delegate: AddToCartButtonDelegate?
    
    enum CommunicationType {
        case delegate
        case callback
    }
    
    private var communicationType: CommunicationType = .callback
    
    private let scrollView = UIScrollView()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

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
        button.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let device: Device
    
    // MARK: - Life cycle
    
    init(device: Device) {
        self.device = device
        super.init(nibName: nil, bundle: nil)
        upateDevice()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubviews(iconImageView, modelNameLabel, priceLabel, descriptionLabel, addToCartButton)
    }
    
    // MARK: - Actions
    
    @objc private func addToCartButtonTapped() {
        switch communicationType {
        case .delegate:
            delegate?.didTapAddToCartButton(device)
        case .callback:
            onSelectDevice?(device)
        }
    }
    
    private func upateDevice() {
        iconImageView.image = device.image
        modelNameLabel.attributedText = TextFormatter.titleText(with: device.name)
        descriptionLabel.attributedText = TextFormatter.descriptionText(with: device.description ?? "")
        priceLabel.attributedText = TextFormatter.priceText(with: device.price)
        title = device.name
    }
    
    // MARK: - Layout
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // // Layout with frames
        
        let imageWidth: CGFloat = view.bounds.width - 32 * 2
        let baseWidth: CGFloat = view.bounds.width - 32 * 2
        let baseTopInset: CGFloat = 32
        let modelLabelInset: CGFloat = 32
        let descriptionLabelInset: CGFloat = 24
        let priceLabelInset: CGFloat = 64
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
            y: view.safeAreaInsets.top + baseTopInset,
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
            y: priceLabel.frame.maxY + baseTopInset,
            width: buttonWidth,
            height: buttonHeight
        )
        
        let contentSizeHeight: CGFloat = baseTopInset + imageWidth + modelLabelInset + modelNameHeight + descriptionLabelInset + descriptionHeight + priceLabelInset + priceHeight + baseTopInset + buttonHeight + bottomInset
        
        scrollView.contentSize = CGSize(width: view.bounds.width, height: contentSizeHeight)
    }
    
}

extension DeviceDetailViewController {
    var buttonHeight: CGFloat { return 44 }
    var buttonWidth: CGFloat { return 140 }
    
    static func labelHeight(with attributedText: NSAttributedString?) -> CGFloat {
        return attributedText?.height(widthLimit: UIScreen.main.bounds.width - 64) ?? 0
    }
}
