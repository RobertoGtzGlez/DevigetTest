//
//  NetworkManager.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/28/19.
//  Copyright © 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import Foundation

class NetworkManager {
    
    //MARK: - Constants
    private struct Constants {
        static let redditURL  = "https://www.reddit.com/top.json?limit=50"
    }
    
    //MARK: - Singleton
    static let shared = NetworkManager()
    
    //MARK: - Private init
    private init() {}

    func getRedditPosts(completion: @escaping (RedditResponse?) -> Void ) {
        guard let url = URL(string: Constants.redditURL) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    let decoder = CodableParser.createDecoder()
                    do {
                        let decodedPosts = try decoder.decode(RedditResponse.self, from: data)
                        completion(decodedPosts)
                    } catch let err {
                        print(err.localizedDescription)
                        completion(nil)
                    }
                }
            }
        }
        task.resume()
    }
}

class CodableParser {
    class func createDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }
}

