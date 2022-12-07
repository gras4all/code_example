//
//  DevicesCollectionViewController+DataSource.swift
//  iStore
//
//  Created by Andrey Grunenkov on 06.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

import UIKit

extension DevicesCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return devices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: DeviceCollectionViewCell.self),
            for: indexPath
            ) as? DeviceCollectionViewCell
        else { return UICollectionViewCell() }
        cell.device = devices[indexPath.row]
        return cell
    }
    
}
