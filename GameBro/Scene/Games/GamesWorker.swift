//
//  GamesWorker.swift
//  GameBro
//
//  Created by Ariel Theodore W on 20/07/20.
//  Copyright © 2020 ariltw. All rights reserved.
//

protocol GamesType {
    func fetchList(by page: String, success: @escaping (Games.List.Response) -> Void, failed: @escaping (Error) -> Void)
    func fetchDetail(by id: String, success: @escaping (Games.Detail.Response) -> Void, failed: @escaping (Error) -> Void)
}

class GamesWorker: GamesType {
    
    func fetchList(by page: String, success: @escaping (Games.List.Response) -> Void, failed: @escaping (Error) -> Void) {
        do {
            
        } catch {
            print("Unexpected error: \(error).")
        }
    }
    
    func fetchDetail(by id: String, success: @escaping (Games.Detail.Response) -> Void, failed: @escaping (Error) -> Void) {
        do {
            
        } catch {
            print("Unexpected error: \(error).")
        }
    }
}
