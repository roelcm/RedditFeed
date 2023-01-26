//
//  Post.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import Foundation

/// Reddit Post
struct Post: Decodable, Identifiable {
    let id: String
    let title: String
    let selftext: String
    let url: String
    let author: String
    let num_comments: Int
    let ups: Int
}
