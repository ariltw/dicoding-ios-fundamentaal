//
//  GamesWorker.swift
//  GameBro
//
//  Created by Ariel Theodore W on 20/07/20.
//  Copyright © 2020 ariltw. All rights reserved.
//

import Foundation

protocol GamesType {
    func fetchList(from nextPage: String, completion: @escaping (Result<Games.List.Response, Error>) -> Void)
    func fetchDetail(with id: String, completion: @escaping (Result<Games.Detail.Response, Error>) -> Void)
}

class GamesWorker: GamesType {
    
    private let restClient = RestClient()
    
    func fetchList(from nextPage: String, completion: @escaping (Result<Games.List.Response, Error>) -> Void) {
        restClient.GET(from: Games.List.API + nextPage, with: nil) { (result) in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(Games.List.Response.self, from: data)
                    completion(.success(response))
                } catch {
                    print("Parsing data error: \(error)")
                    completion(.failure(BaseError.internalError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchDetail(with id: String, completion: @escaping (Result<Games.Detail.Response, Error>) -> Void) {
        restClient.GET(from: Games.Detail.API + id, with: nil) { (result) in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(Games.Detail.Response.self, from: data)
                    completion(.success(response))
                } catch {
                    print("Parsing data error: \(error)")
                    completion(.failure(BaseError.internalError))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
