//
//  NetworkManager.swift
//  iStore
//
//  Created by Андрей Груненков on 06.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case unknownError
    case connectionError
    case authorizationError
    case parseError
    case invalidRequest
    case notFound
    case invalidResponse
    case serverError
    case serverUnavailable
    
    func getDescription() ->String {
        switch self {
        case .serverError:
            return "Internal server error"
        case .authorizationError:
            return "Authorization error"
        case .connectionError:
            return "Connection error"
        case .parseError:
            return "Parse error"
        default:
            return "Unknown error"
        }
    }
    
}

final class NetworkManager: NetworkManagerProtocol {
    
    func executeRequest<T: Decodable>(url: String, completion: @escaping (T?, RequestError?) -> Void) {
        
        guard let urlRequest = RequestBuilder.buildSimpleGetRequest(url: url) else {
            completion(nil, RequestError.invalidRequest)
            return
        }
        
        performRequest(request: urlRequest) { [weak self] data, response, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.handleNetworkResponse(data: data, response: response, error: error, completion: completion)
            }
        }
        
    }
    
}

private extension NetworkManager {
    
    func performRequest(request: URLRequest,
                                completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: completion)
        dataTask.resume()
    }
    
    func handleNetworkResponse<T: Decodable>(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (T?, RequestError?) -> Void) {
        if let error = error {
            print(error)
            completion(nil, RequestError.connectionError)
        } else if let data = data,
                  let response = response as? HTTPURLResponse {
            switch response.statusCode {
            case 200:
                do {
                    let parsedResult = try JSONDecoder().decode(T.self, from: data)
                    completion(parsedResult, nil)
                }
                catch let parseJSONError {
                    completion(nil, RequestError.parseError)
                    print("error on parsing request to JSON : \(parseJSONError)")
                }
            case 400...499:
                completion(nil, RequestError.authorizationError)
            case 500...599:
                completion(nil, RequestError.serverError)
            default:
                completion(nil, RequestError.unknownError)
                break
            }
        } else {
            completion(nil, RequestError.unknownError)
        }
    }
    
}

