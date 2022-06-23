//
//  DevicesCollectionViewController.swift
//  iStore
//
//  Created by Andrey Grunenkov on 27.05.2020.
//  Copyright © 2020 Andrey Grunenkov. All rights reserved.
//

import UIKit

final class DevicesCollectionViewController: UIViewController {
    
    private let navBarTitle = "iStore"
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(
            DeviceCollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: DeviceCollectionViewCell.self)
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

}

private extension DevicesCollectionViewController {
    
    func setupViews() {
        view.backgroundColor = .white
        title = navBarTitle
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        
        // Layout with constraints
        
        [collectionView.topAnchor.constraint(equalTo: view.safeTopAnchor),
         collectionView.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor),
         collectionView.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor),
         collectionView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor)
        ]
        .forEach { $0.isActive = true }
    }
    
}

extension UIView {

    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        }
        return self.topAnchor
    }

    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.leadingAnchor
        }
        return self.leadingAnchor
    }

    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.trailingAnchor
        }
        return self.trailingAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        }
        return self.bottomAnchor
    }
    
}
