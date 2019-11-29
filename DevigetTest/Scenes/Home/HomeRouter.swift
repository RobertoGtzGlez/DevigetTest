//
//  HomeRouter.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/29/19.
//  Copyright (c) 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import UIKit

protocol HomeRoutingLogic {
    func routeToDetailView(_ post: Post)
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    func routeToDetailView(_ post: Post) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        var destinationDS = destinationVC.router!.dataStore!
        dataStore?.post = post
        passDataToComments(source: dataStore!, destination: &destinationDS)
        navigateToComments(source: viewController!, destination: destinationVC)
    }
    
    // MARK: Navigation
    func navigateToComments(source: HomeViewController, destination: DetailViewController) {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToComments(source: HomeDataStore, destination: inout DetailDataStore) {
        destination.post = source.post
    }
}


