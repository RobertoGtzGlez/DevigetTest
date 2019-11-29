//
//  HomeTableViewCell.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/29/19.
//  Copyright © 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import UIKit

protocol PostDismissable: AnyObject {
    func postDismissed(at index: IndexPath)
}

class HomeTableViewCell: UITableViewCell {
    
    weak var delegate: PostDismissable?
    var indexPath: IndexPath?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView! {
        didSet {
            postImage.layer.cornerRadius = self.postImage.frame.size.height / 2
            postImage.layer.borderColor = UIColor.lightGray.cgColor
            postImage.layer.borderWidth = 1.0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        delegate?.postDismissed(at: indexPath ?? IndexPath(row: 0, section: 0))
    }
}
