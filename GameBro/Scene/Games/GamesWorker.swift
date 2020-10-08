//
//  GamesWorker.swift
//  GameBro
//
//  Created by Ariel Theodore W on 20/07/20.
//  Copyright © 2020 ariltw. All rights reserved.
//

import Foundation

protocol GamesType {
    func fetchList(from nextPage: String, success: @escaping (Games.List.Response) -> Void, failed: @escaping (Error) -> Void)
    func fetchDetail(with id: String, success: @escaping (Games.Detail.Response) -> Void, failed: @escaping (Error) -> Void)
}

class GamesWorker: GamesType {
    
    let restClient = RestClient()
    
    func fetchList(from nextPage: String, success: @escaping (Games.List.Response) -> Void, failed: @escaping (Error) -> Void) {
//        self.restClient.GET(from: nextPage, with: nil) { (data) in
//            do {
//                let response = try JSONDecoder().decode(Games.List.Response.self, from: data)
//                success(response)
//            } catch {
//                print("Parsing Data Error: \(error)")
//                failed(Error().JSONParsingFailed())
//            }
//        } errorHandler: { (error) in
//            print("Retrive Data Error: \(error)")
//            failed(error)
//        }
    }
    
    func fetchDetail(with id: String, success: @escaping (Games.Detail.Response) -> Void, failed: @escaping (Error) -> Void) {
//        self.restClient.GET(from: id, with: nil) { (data) in
//            do {
//                let response = try JSONDecoder().decode(Games.Detail.Response, from: data)
//                success(response)
//            } catch {
//                print("Parsing Data Error: \(error)")
//                failed(Error().JSONParsingFailed())
//            }
//        } errorHandler: { (error) in
//            print("Retrive Data Error: \(error)")
//            failed(error)
//        }
    }
}
