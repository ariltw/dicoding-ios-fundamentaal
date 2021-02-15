//
//  RestClient.swift
//  GameBro
//
//  Created by Ariel Theodore W on 22/07/20.
//  Copyright © 2020 ariltw. All rights reserved.
//

import Foundation
import SystemConfiguration

class RestClient {
    
    fileprivate var BASE_URL = "https://api.rawg.io"
    
    func GET(from url: String, with params: [URLQueryItem]?, completionHandler: @escaping (Result<Data, BaseError>) -> Void) {
        let request = composeRequest(from: url, with: params, with: nil, method: "GET")
        
        run(using: request) { (result) in
            switch result {
            case .success(( _, let data)):
                completionHandler(.success(data))
                break
            case .failure(let error):
                completionHandler(.failure(error))
                break
            }
        }
    }
    
    func POST(from url: String, with params: [URLQueryItem]?, body: Data, completionHandler: @escaping (Result<Data, BaseError>) -> Void) {
        let request = composeRequest(from: url, with: params, with: body, method: "POST")
        
        run(using: request) { (result) in
            switch result {
            case .success(( _, let data)):
                completionHandler(.success(data))
                break
            case .failure(let error):
                completionHandler(.failure(error))
                break
            }
        }
    }
    
}

extension RestClient {
    
    typealias DataTaskResult = Result<(URLResponse, Data), BaseError>
    
    private func composeRequest(from URL: String!, with params: [URLQueryItem]?, with body: Data?, method: String!) -> URLRequest {
        var components = URLComponents(string: BASE_URL + URL)!
        
        // compose params
        params?.forEach({ (item) in
            components.queryItems?.append(item)
        })
        
        // compose request
        var request = URLRequest(url: components.url!)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // compose body
        if let body = body {
            let bodyEncoded = try! JSONEncoder().encode(body)
            request.httpBody = bodyEncoded
        }
        
        return request
    }
    
    private func run(using request: URLRequest!, completionHandler: @escaping (DataTaskResult) -> Void) {
        
        // check connection
        if !hasConnection(to: BASE_URL) {
            completionHandler(Result.failure(BaseError.serverUnreachable))
        }
        
        // run http request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let responses = response as? HTTPURLResponse
            let status = responses?.statusCode
            
            // transport error
            if error != nil {
                print(error!)
                completionHandler(Result.failure(BaseError.networkFailed))
                return
            }
            
            // server side error
            guard (200...299).contains(status ?? 501) else {
                completionHandler(Result.failure(BaseError.serverSideError))
                return
            }
            
            completionHandler(.success((response!, data!)))
        }
        
        task.resume()
    }
    
    private func hasConnection (to url: String) -> Bool {
        let reachability = SCNetworkReachabilityCreateWithName(nil, url)
        
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)
        
        func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool {
            let isReachable = flags.contains(.reachable)
            let needsConnection = flags.contains(.connectionRequired)
            let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
            let canConnectWithoutUserInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
            return isReachable && (!needsConnection || canConnectWithoutUserInteraction)
        }
        
        return isNetworkReachable(with: flags)
    }
}
