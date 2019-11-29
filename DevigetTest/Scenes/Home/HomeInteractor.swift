//
//  HomeInteractor.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/29/19.
//  Copyright (c) 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import UIKit

protocol HomeBusinessLogic {
    func loadData(request: Home.Load.Request)
}

protocol HomeDataStore {
    var post: Post? { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    var post: Post?
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
  
    func loadData(request: Home.Load.Request) {
    
        worker = HomeWorker()
        worker?.fetchPosts() { [weak self] response in
            DispatchQueue.main.async {
                guard let posts = response else { return }
                let responseData = Home.Load.Response(redditPosts: posts)
                self?.presenter?.presentInitialData(response: responseData)
            }
        }
    }
}
