//
//  GamesInteractor.swift
//  GameBro
//
//  Created by Ariel Theodore W on 20/07/20.
//  Copyright © 2020 ariltw. All rights reserved.
//

protocol GamesBusinessLogic {
    func requestList(page: String)
    func requestDetail(id: String)
}

protocol GamesDataStore {
    
}

class GamesInteractor: GamesBusinessLogic, GamesDataStore {
    
    var presenter: GamesPresentationLogic?
    var worker = GamesWorker()
    
    func requestList(page: String) {
        worker.fetchList(from: page) { (result) in
            switch result {
            case .success(let response):
                self.presenter?.presentList(result: .success(response))
            case .failure(let error):
                self.presenter?.presentList(result: .failure(error))
            }
        }
    }
    
    func requestDetail(id: String) {
        worker.fetchDetail(with: id) { (result) in
            switch result {
            case .success(let response):
                self.presenter?.presentDetail(result: .success(response))
            case .failure(let error):
                self.presenter?.presentDetail(result: .failure(error))
            }
        }
    }
}
