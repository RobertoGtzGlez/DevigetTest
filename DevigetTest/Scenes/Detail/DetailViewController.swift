//
//  DetailViewController.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/29/19.
//  Copyright (c) 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import UIKit

protocol DetailDisplayLogic: class {
    func displayPost(viewModel: Detail.View.ViewModel)
}

class DetailViewController: UIViewController, DetailDisplayLogic {
  
    var interactor: DetailBusinessLogic?
    var router: (NSObjectProtocol & DetailRoutingLogic & DetailDataPassing)?
    
    @IBOutlet weak var postImage: UIImageView!
  
    // MARK: Setup
  
    private func setup() {
        let viewController = self
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
      
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        retrievePost()
    }
  
    func retrievePost() {
        let request = Detail.View.Request()
        interactor?.getPost(request: request)
    }
  
    func displayPost(viewModel: Detail.View.ViewModel) {
        postImage.cacheImage(urlString: viewModel.post.data?.thumbnail ?? "")
    }
}
