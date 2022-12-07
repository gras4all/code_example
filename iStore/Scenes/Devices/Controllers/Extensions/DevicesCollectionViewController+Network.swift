//
//  DevicesCollectionViewController+Network.swift
//  iStore
//
//  Created by Андрей Груненков on 06.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

import UIKit

extension DevicesCollectionViewController {
    
    func showLoading() {
        view.addSubview(loaderView)
        NSLayoutConstraint.activate([
            loaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loaderView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        loaderView.startAnimating()
    }
    
    func hideLoading() {
        loaderView.stopAnimating()
        loaderView.removeFromSuperview()
    }
    
    func startLoadDevices() {
        showLoading()
        performDevicesRequest { [weak self] devices, error in
            guard let self = self else { return }
            self.hideLoading()
            if let error = error {
                self.showError(description: error.getDescription())
            }
            if let devices = devices {
                self.devices = devices
                self.collectionView.reloadData()
            }
        }
    }
    
    func performDevicesRequest(completion: @escaping ([Device]?, RequestError?) -> Void) {
        networkManager.executeRequest(url: Constants.devicesUrl, completion: completion)
    }
    
    private func showError(description: String) {
        let alertController = UIAlertController(title: "Error",
                                                message: description + " occurred while loading data",
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok",
                                         style: .cancel,
                                         handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
