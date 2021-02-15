//
//  GamesPresenter.swift
//  GameBro
//
//  Created by Ariel Theodore W on 20/07/20.
//  Copyright © 2020 ariltw. All rights reserved.
//

protocol GamesPresentationLogic {
    func presentList(result: Result<Games.List.Response, Error>)
    func presentDetail(result: Result<Games.Detail.Response, Error>)
}

class GamesPresenter: GamesPresentationLogic {
    weak var viewList: GamesListDisplayLogic?
    weak var viewDetail: GamesDetailDisplayLogic?
    
    func presentList(result: Result<Games.List.Response, Error>) {
        
    }
    
    func presentDetail(result: Result<Games.Detail.Response, Error>) {
        
    }
}
