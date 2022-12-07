//
//  DevicesCollectionViewController.swift
//  iStore
//
//  Created by Andrey Grunenkov on 06.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

import UIKit

final class DevicesCollectionViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.turnOffAutoresizingMask()
        collectionView.backgroundColor = .white
        collectionView.register(
            DeviceCollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: DeviceCollectionViewCell.self)
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    var loaderView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .gray
        view.turnOffAutoresizingMask()
        return view
    }()
    
    let transitionManager = DeviceTransitionManager(duration: 0.4)
    let networkManager: NetworkManagerProtocol = NetworkManager()
    
    var selectedCell: DeviceCollectionViewCell?
    var devices: [Device] = []
    
    private let navBarTitle = "iStore"
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        startLoadDevices()
    }

}

// MARK: - private methods
private extension DevicesCollectionViewController {
    
    func setupViews() {
        view.backgroundColor = .white
        title = navBarTitle
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        
        // Make layout with constraints
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.safeTopAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])

    }
    
}


