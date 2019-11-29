//
//  DetailPresenter.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/29/19.
//  Copyright (c) 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import UIKit

protocol DetailPresentationLogic {
    func presentPost(response: Detail.View.Response)
}

class DetailPresenter: DetailPresentationLogic {
  
    weak var viewController: DetailDisplayLogic?
  
    func presentPost(response: Detail.View.Response) {
        let viewModel = Detail.View.ViewModel(post: response.post)
        viewController?.displayPost(viewModel: viewModel)
    }
}
