//
//  DetailInteractor.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/29/19.
//  Copyright (c) 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import UIKit

protocol DetailBusinessLogic {
    func getPost(request: Detail.View.Request)
}

protocol DetailDataStore {
    var post: Post? { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    var post: Post?
    var presenter: DetailPresentationLogic?
    
    func getPost(request: Detail.View.Request) {
        guard let postPassed = post else {
            return
        }
        let post = Detail.View.Response(post: postPassed)
        presenter?.presentPost(response: post)
    }
}
