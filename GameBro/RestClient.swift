//
//  RestClient.swift
//  GameBro
//
//  Created by Ariel Theodore W on 22/07/20.
//  Copyright © 2020 ariltw. All rights reserved.
//

import Foundation

protocol RC {
    
}

class RestClient {
    
    fileprivate var BASE_URL = ""
    
    func GET(from API: String, with params: [URLQueryItem]?) -> HTTPURLResponse {
        
    }
    
    func POST(from api: String, with param: [URLQueryItem]?, body: Data) -> HTTPURLResponse {
        
    }
    
}

extension RestClient {
    
    fileprivate func composeRequest(from URL: String!, with params: [URLQueryItem]?, with body: Data?, method: String!) -> URLRequest {
        var components = URLComponents(string: BASE_URL + URL)!
        let bodyEncoded = try! JSONEncoder().encode(body)
        
        for param in params! {
            components.queryItems?.append(param)
        }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method
        request.httpBody = bodyEncoded
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    fileprivate func runRequest(to request: URLRequest!, with body: Data?) -> HTTPURLResponse {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let response = response as? HTTPURLResponse, let data = data else { return }
            return response
        }
    }
}
