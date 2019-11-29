//
//  RedditResponse.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/28/19.
//  Copyright © 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import Foundation

// MARK: - RedditResponse
struct RedditResponse: Codable {
    let kind: String?
    let data: RedditResponseData?
}

// MARK: - RedditResponseData
struct RedditResponseData: Codable {
    let modhash: String?
    let dist: Int?
    let children: [Posts]?
}

// MARK: - Child
struct Posts: Codable {
    let kind: String?
    let data: ChildData?
}

// MARK: - ChildData
struct ChildData: Codable {
    let authorFullname, title, name: String?
    let quarantine: Bool?
    let linkFlairTextColor, subredditType: String?
    let ups, totalAwardsReceived: Int?
    let mediaEmbed: MediaEmbed?
    let thumbnailWidth, score: Int?
    let thumbnail: String?
    let postHint: String?
    let created: Int?
    let id, author: String?
    let numComments: Int?
    let url: String?
    let subredditSubscribers, createdUTC: Int?

    enum CodingKeys: String, CodingKey {
        case authorFullname = "author_fullname"
        case title, name, quarantine
        case linkFlairTextColor = "link_flair_text_color"
        case subredditType = "subreddit_type"
        case ups
        case totalAwardsReceived = "total_awards_received"
        case mediaEmbed = "media_embed"
        case thumbnailWidth = "thumbnail_width"
        case score, thumbnail
        case postHint = "post_hint"
        case created, id, author
        case numComments = "num_comments"
        case url
        case subredditSubscribers = "subreddit_subscribers"
        case createdUTC = "created_utc"
    }
}

// MARK: - MediaEmbed
struct MediaEmbed: Codable {
}
