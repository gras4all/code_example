//
//  UIView+Utilites.swift
//  iStore
//
//  Created by Андрей Груненков on 07.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
    func turnOffAutoresizingMask() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
