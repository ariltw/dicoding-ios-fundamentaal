//
//  GamesPresenter.swift
//  GameBro
//
//  Created by Ariel Theodore W on 20/07/20.
//  Copyright © 2020 ariltw. All rights reserved.
//

protocol GamesPresentationLogic {
    func presentList(success: Games.List.Response)
    func presentDetail(success: Games.Detail.Response)
}

class GamesPresenter: GamesPresentationLogic {
    func presentList(success: Games.List.Response) {
//        <#code#>
    }
    
    func presentDetail(success: Games.Detail.Response) {
//        <#code#>
    }
    
    
    weak var viewList: GamesListDisplayLogic?
    weak var viewDetail: GamesDetailDisplayLogic?
    
//    func presentList(response: Games.List.Response) {
//        let data = Games.List.ViewModel(game: response.games!)
//        viewList?.fetchListResult(viewModel: data)
//    }
//
//    func presentDetail(response: Games.Detail.Response) {
//        let data = Games.Detail.ViewModel(game: response)
//        viewDetail?.fetchDetailResult(viewModel: data)
//    }
}
