//
//  UIView+ShadowCornerRadius.swift
//
//  Created by Andrey Grunenkov on 06.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Method adds shadow and corner radius for top of view by default.
    ///
    /// - Parameters:
    ///   - top: Top corners
    ///   - bottom: Bottom corners
    ///   - radius: Corner radius
    func roundCornersWithRadius(_ radius: CGFloat, top: Bool? = true, bottom: Bool? = true, shadowEnabled: Bool = true) {
        var maskedCorners = CACornerMask()
        
        if shadowEnabled {
            clipsToBounds = true
            layer.masksToBounds = false
            layer.shadowOpacity = 0.5
            layer.shadowColor = UIColor(white: 0.0, alpha: 1.0).cgColor
            layer.shadowRadius = 4
            layer.shadowOffset = CGSize(width: 4, height: 4)
        }
        
        switch (top, bottom) {
        case (true, false):
            maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        case (false, true):
            maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        case (true, true):
            maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        default:
            break
        }
        
        layer.cornerRadius = radius
        layer.maskedCorners = maskedCorners
    }
    
}
