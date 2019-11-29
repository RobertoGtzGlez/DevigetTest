//
//  ViewController.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/28/19.
//  Copyright © 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.getRedditPosts { (redditResponse) in
            print(redditResponse)
        }
    }


}

