//
//  RequestBuilder.swift
//  iStore
//
//  Created by Андрей Груненков on 06.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

import Foundation

final class RequestBuilder {

    private static let defaultHeaders = [
        "Content-Type" : "application/json"
    ]

    static func buildSimpleGetRequest(url: String) -> URLRequest? {
        guard let url = URL(string: url) else { return nil }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = defaultHeaders
        return request
    }

}
