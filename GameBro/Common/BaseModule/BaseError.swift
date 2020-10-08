//
//  BaseError.swift
//  GameBro
//
//  Created by Ariel Theodore W on 01/08/20.
//  Copyright © 2020 ariltw. All rights reserved.
//

import Foundation

enum BaseError: String, Error {
    case invalidUrl = "URL is invalid! Please check your endpoint"
    case invalidRequest = "Request data is invalid! Please check your request"
    case invalidResponse = "Response is invalid! Please check your endpoint response"
    
    case networkFailed = "Network Failure! Please check your connection"
        
    case serverUnreachable = "Server is unreachable! Please check your connection"
    case serverSideError = "Server Error! Please check network request"
    
    case networkError = "Network error! Please check your connection"
}
