//
//  HomeWorker.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/29/19.
//  Copyright (c) 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import UIKit

class HomeWorker {
  
    func fetchPosts(completion: @escaping(RedditResponse?) -> Void) {
        NetworkManager.shared.getRedditPosts { (redditResponse) in
            completion(redditResponse ?? nil)
        }
    }
}
