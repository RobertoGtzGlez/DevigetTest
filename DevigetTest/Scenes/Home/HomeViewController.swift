//
//  HomeViewController.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/29/19.
//  Copyright (c) 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: class {
    func displayData(viewModel: Home.Load.ViewModel)
}

class HomeViewController: UIViewController, HomeDisplayLogic {
  
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    private(set) var redditPosts: [Posts]?
  
    // MARK: Setup
  
    private func setup() {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadInitialData()
    }
  
    func loadInitialData() {
        let request = Home.Load.Request()
        interactor?.loadData(request: request)
    }
  
    func displayData(viewModel: Home.Load.ViewModel) {
        redditPosts = viewModel.redditPosts.data?.children
    }
}
