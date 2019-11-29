//
//  HomePresenter.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/29/19.
//  Copyright (c) 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import UIKit

protocol HomePresentationLogic {
    func presentInitialData(response: Home.Load.Response)
}

class HomePresenter: HomePresentationLogic {
  
    weak var viewController: HomeDisplayLogic?
  
    func presentInitialData(response: Home.Load.Response) {
        let viewModel = Home.Load.ViewModel(redditPosts: response.redditPosts)
        viewController?.displayData(viewModel: viewModel)
    }
}
