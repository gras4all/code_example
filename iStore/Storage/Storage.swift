//
//  Storage.swift
//  iStore
//
//  Created by Andrey Grunenkov on 27.05.2020.
//  Copyright © 2020 Andrey Grunenkov. All rights reserved.
//

import Foundation

struct Storage {
    
    static let devices = [
        [
            Device(image: #imageLiteral(resourceName: "imac_retina"), name: "iMac 27' Retina 5K", price: "1 200 $", description: "3.7GHz 6‑core Intel Core i5 (Turbo Boost up to 4.6GHz)/n Configurable to 3.6GHz 8-core Intel Core i9 (Turbo Boost up to 5.0GHz)/n27-inch (diagonal) Retina 5K display 5120‑by‑2880 resolution with support for one billion colors 500 nits brightness Wide color (P3)"),
            Device(image: #imageLiteral(resourceName: "imac_pro"), name: "iMac 27' Pro, Retina 5K", price: "4 100 $"),
            Device(image: #imageLiteral(resourceName: "mac_mini"), name: "mac mini", price: "999 $", description: "Created by Andrey Grunenkov on 27.05.2020.Copyright © 2020 Andrey Grunenkov. All rights reserved."),
            Device(image: #imageLiteral(resourceName: "mac_pro"), name: "mac Pro", price: "6 200 $"),
        ],
        [
            Device(image: #imageLiteral(resourceName: "ipad_pro"), name: "iPad Pro", price: "1 600 $"),
            Device(image: #imageLiteral(resourceName: "pro_silver"), name: "iPad Air", price: "1 100 $"),
            Device(image: #imageLiteral(resourceName: "ipad_mini"), name: "iPad mini", price: "899 $", description: "Created by Andrey Grunenkov on 27.05.2020.Copyright © 2020 Andrey Grunenkov. All rights reserved."),
            Device(image: #imageLiteral(resourceName: "ipad_pro"), name: "iPad Pro black", price: "2 000 $")
        ],
        [
            Device(image: #imageLiteral(resourceName: "pro_gold"), name: "iPhone 11 Pro Gold", price: "1 200"),
            Device(image: #imageLiteral(resourceName: "pro_green"), name: "iPhone 11 Pro Green", price: "1 200 $", description: "Created by Andrey Grunenkov on 27.05.2020.Copyright © 2020 Andrey Grunenkov. All rights reserved."),
            Device(image: #imageLiteral(resourceName: "xr_blue"), name: "iPhone XR Blue", price: "799 $"),
            Device(image: #imageLiteral(resourceName: "se_red"), name: "iPhone SE Product Red", price: "499 $"),
        ]
    ]
    
}
