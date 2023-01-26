//
//  MockData.swift
//  SwiftConcurrency
//
//  Created by Roel Castano on 1/25/23.
//

import Foundation

extension SubredditListing {
    static var mockListing: SubredditListing {
        Bundle.main.decode(SubredditListing.self, from: "memesAPIResponse.json")
    }
}

extension Post {
    /// Used to create a Post for example Debug purposes
    static var mockPost: Post {
        Post(id: "123456", title: "Test Post Title", selftext: "Test Post description \n More test post text", url: "", author: "me", num_comments: 50, ups: 1000)
    }
}

extension Comment {
    /// Used to initialize a Comment for Debug purposes
    static var mockComment: Comment {
        Comment(
            id: "1000",
            author: "Test User",
            score: 100,
            body: "This is a test comment")
    }
}
