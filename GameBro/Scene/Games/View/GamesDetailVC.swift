//
//  GamesDetail.swift
//  GameBro
//
//  Created by Ariel Theodore W on 20/07/20.
//  Copyright © 2020 ariltw. All rights reserved.
//

import UIKit

protocol GamesDetailDisplayLogic: class {
    func fetchDetailResult(viewModel: Games.Detail.ViewModel)
}

class GamesDetailVC: BaseViewController, GamesDetailDisplayLogic {
    
    
    func fetchDetailResult(viewModel: Games.Detail.ViewModel) {
//        <#code#>
    }
}
