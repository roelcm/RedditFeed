//
//  Post.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import Foundation

/// Reddit listing for subreddit
struct SubredditListing: Decodable {
    let data: ListingData
    var posts: [Post] {
        return data.children.map { (postData) -> Post in
            postData.data
        }
    }
    
    struct ListingData: Decodable {
        let children: [PostData]
        
        struct PostData: Decodable {
            let data: Post
        }
    }
}
