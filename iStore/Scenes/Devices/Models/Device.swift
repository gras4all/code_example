//
//  Device.swift
//  iStore
//
//  Created by Andrey Grunenkov on 06.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

struct Device: Decodable {
    
    let name: String
    let url: String
    let price: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
        case price
        case description
    }
    
}
