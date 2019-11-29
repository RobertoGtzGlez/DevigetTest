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
    
    // MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    private var tableViewHandler: TableViewDataSource<UITableViewCell, Post>?
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    private(set) var redditPosts: [Post]?
    
    // MARK:- Constants
    private struct Constants {
        static let cellIdentifier = "Cell"
    }
  
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
        DispatchQueue.main.async {
            self.setupTableView()
            self.tableView.reloadData()
        }
    }
    
    private func setupTableView() {
        guard let posts = redditPosts else { return }
        self.tableViewHandler = TableViewDataSource<UITableViewCell, Post>(Constants.cellIdentifier, posts, cellConfigurationBlock: { (cell, post) in
            
            cell.textLabel?.text = post.data?.title
            
        }, cellSelectorHandler: { (post) in
            
        })
        self.tableView.dataSource = tableViewHandler
        self.tableView.delegate = tableViewHandler
    }
}
