//
//  Comment.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import Foundation

/// Reddit Comment
struct Comment: Decodable {
    let id: String
    let author: String
    let score: Int
    let body: String?
}
