//
//  HomeModels.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/29/19.
//  Copyright (c) 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import UIKit

enum Home {
  
    // MARK: Use cases
  
    enum Load {
        
        struct Request {}
        struct Response {
            let redditPosts: RedditResponse
        }
        struct ViewModel {
            let redditPosts: RedditResponse
        }
    }
}
