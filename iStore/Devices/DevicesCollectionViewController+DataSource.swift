//
//  DevicesCollectionViewController+DataSource.swift
//  iStore
//
//  Created by Andrey Grunenkov on 27.05.2020.
//  Copyright © 2020 Andrey Grunenkov. All rights reserved.
//

import UIKit

extension DevicesCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Storage.devices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Storage.devices[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: DeviceCollectionViewCell.self),
            for: indexPath
            ) as? DeviceCollectionViewCell
        else { return UICollectionViewCell() }
        cell.device = Storage.devices[indexPath.section][indexPath.item]
        return cell
    }
}
