//
//  DeviceTransitionManager.swift
//  iStore
//
//  Created by Андрей Груненков on 06.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

import UIKit

final class DeviceTransitionManager: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let duration: TimeInterval
    private var operation = UINavigationController.Operation.push
    
    init(duration: TimeInterval) {
        self.duration = duration
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromViewController = transitionContext.viewController(forKey: .from),
            let toViewController = transitionContext.viewController(forKey: .to)
        else {
            transitionContext.completeTransition(false)
            return
        }
        
        animateTransition(from: fromViewController, to: toViewController, with: transitionContext)
    }
}

// MARK: - UINavigationControllerDelegate
extension DeviceTransitionManager: UINavigationControllerDelegate {
    func navigationController(
        _ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.operation = operation
        
        if operation == .push {
            return self
        }
        
        return nil
    }
}


// MARK: - Animations
private extension DeviceTransitionManager {
    
    func animateTransition(from fromViewController: UIViewController, to toViewController: UIViewController, with context: UIViewControllerContextTransitioning) {
        switch operation {
        case .push:
            guard
                let albumsViewController = fromViewController as? DevicesCollectionViewController,
                let detailsViewController = toViewController as? DeviceDetailViewController
            else { return }
            
            presentViewController(detailsViewController, from: albumsViewController, with: context)
            
        case .pop:
            guard
                let detailsViewController = fromViewController as? DeviceDetailViewController,
                let albumsViewController = toViewController as? DevicesCollectionViewController
            else { return }
            
            dismissViewController(detailsViewController, to: albumsViewController)
            
        default:
            break
        }
    }
    
    func presentViewController(_ toViewController: DeviceDetailViewController, from fromViewController: DevicesCollectionViewController, with context: UIViewControllerContextTransitioning) {
        
        guard let deviceCell = fromViewController.selectedCell,
              let deviceImageView = fromViewController.selectedCell?.iconImageView,
              let deviceDetailView = toViewController.view
        else { return}
        
        toViewController.view.layoutIfNeeded()
        
        let containerView = context.containerView
        
        let snapshotContentView = UIView()
        snapshotContentView.backgroundColor = .white
        snapshotContentView.frame = containerView.convert(deviceCell.contentView.frame, from: deviceCell)
        snapshotContentView.roundCornersWithRadius(20)
        snapshotContentView.layer.masksToBounds = true
        
        let snapshotDeviceImageView = UIImageView()
        snapshotDeviceImageView.clipsToBounds = true
        snapshotDeviceImageView.contentMode = deviceImageView.contentMode
        snapshotDeviceImageView.image = deviceImageView.image
        snapshotDeviceImageView.layer.cornerRadius = deviceImageView.layer.cornerRadius
        snapshotDeviceImageView.frame = containerView.convert(deviceImageView.frame, from: deviceCell)
        
        containerView.addSubview(toViewController.view)
        containerView.addSubview(snapshotContentView)
        containerView.addSubview(snapshotDeviceImageView)
        
        toViewController.view.isHidden = true
        
        let animator = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            snapshotContentView.frame = containerView.convert(toViewController.view.frame, from: toViewController.view)
            snapshotDeviceImageView.frame = containerView.convert(toViewController.iconImageView.frame, from: deviceDetailView)
            
            let navBarHeight = toViewController.navigationController?.navigationBar.frame.size.height ?? 44
            let statusBarHeight = UIApplication.shared.statusBarFrame.height
            
            snapshotDeviceImageView.frame.origin.y = toViewController.view.safeAreaInsets.top + navBarHeight + statusBarHeight
            snapshotDeviceImageView.layer.cornerRadius = 0
        }

        animator.addCompletion { position in
            toViewController.view.isHidden = false
            snapshotDeviceImageView.removeFromSuperview()
            snapshotContentView.removeFromSuperview()
            context.completeTransition(position == .end)
        }

        animator.startAnimation()
    }
    
    func dismissViewController(_ fromViewController: DeviceDetailViewController, to toViewController: DevicesCollectionViewController) {}
    
}

