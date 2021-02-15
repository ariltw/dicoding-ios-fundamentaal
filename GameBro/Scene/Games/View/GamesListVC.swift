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

class GamesListVC: BaseViewController, GamesListDisplayLogic {
    
    var interactor: GamesInteractor?
    var router: (NSObjectProtocol & GamesRoutingLogic & GamesDataPassing)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
      super.init(coder: aDecoder)
      setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = GamesInteractor()
        let presenter = GamesPresenter()
        let router = GamesRouter()
        viewController.interactor = interactor
        // viewController.router
        interactor.presenter = presenter
        presenter.viewList = viewController
        // router.listViewController = viewController
        // router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.requestList(page: "1")
    }
    
    func fetchListResult(viewModel: Games.List.ViewModel) {
        interactor.
    }
}
