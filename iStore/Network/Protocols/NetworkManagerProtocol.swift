//
//  NetworkManagerProtocol.swift
//  iStore
//
//  Created by Андрей Груненков on 06.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
    
    func executeRequest<T: Decodable>(url: String, completion: @escaping (T?, RequestError?) -> Void)
    
}

