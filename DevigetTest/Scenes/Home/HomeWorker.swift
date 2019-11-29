//
//  HomeWorker.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/29/19.
//  Copyright (c) 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import UIKit

class HomeWorker {
  
    private struct Constants {
        static let categoriesFileName = "posts.json"
    }
    
    func fetchPosts(completion: @escaping(RedditResponse?) -> Void) {
        NetworkManager.shared.getRedditPosts { (redditResponse) in
            if redditResponse != nil {
                Storage.store(redditResponse, to: .caches, as: Constants.categoriesFileName)
                completion(redditResponse ?? nil)
            }
        }
    }
}
