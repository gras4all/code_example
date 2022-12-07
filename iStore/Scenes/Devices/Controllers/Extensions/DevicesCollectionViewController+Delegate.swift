//
//  DevicesCollectionViewController+Delegate.swift
//  iStore
//
//  Created by Andrey Grunenkov on 06.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

import UIKit

extension DevicesCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width - sideInset * 3) / 2
        return CGSize(width: width, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: sideInset, left: sideInset, bottom: 0, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let device = devices[indexPath.row]
        let detailViewController = DeviceDetailViewController(device: device)
        self.selectedCell = collectionView.cellForItem(at: indexPath) as? DeviceCollectionViewCell
        navigationController?.delegate = transitionManager
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

private extension DevicesCollectionViewController {
    
    var sideInset: CGFloat { return 8 }
    
}
