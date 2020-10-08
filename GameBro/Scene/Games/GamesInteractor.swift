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
    var id: String? { get set }
}

class GamesInteractor: GamesBusinessLogic, GamesDataStore {
    
    var presenter: GamesPresentationLogic?
    var worker = GamesWorker()
    
    var id: String?
    
    func requestList(page: String) {
//        worker.fetchList(by: page) { (response) in
//            <#code#>
//        } failed: { (error) in
//            <#code#>
//        }
    }
    
    func requestDetail(id: String) {
//        worker.fetchDetail(by: id) { (response) in
//            <#code#>
//        } failed: { (error) in
//            <#code#>
//        }

    }
}
