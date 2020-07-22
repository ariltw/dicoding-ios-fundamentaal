//
//  GamesList.swift
//  GameBro
//
//  Created by Ariel Theodore W on 20/07/20.
//  Copyright © 2020 ariltw. All rights reserved.
//

import UIKit

protocol GamesListDisplayLogic: class {
    func fetchListResult(viewModel: Games.List.ViewModel)
}

class GamesDetail: BaseViewController, GamesListDisplayLogic {
    
    
    func fetchListResult(viewModel: Games.List.ViewModel) {
        <#code#>
    }
}
