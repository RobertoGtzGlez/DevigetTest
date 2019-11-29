//
//  UIImage+extension.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/29/19.
//  Copyright © 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func cacheImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    guard let imageToCache = UIImage(data: data) else { return }
                    imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                    self.image = imageToCache
                }
            }
        }.resume()
    }
}
