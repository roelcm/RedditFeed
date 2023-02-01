//
//  Post.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import Foundation

/// Reddit listing for subreddit
struct SubredditListing: Decodable {
    let data: SubredditListingData
    var posts: [Post] {
        return data.children
            .filter {
                // Filters posts that don't contain images
                $0.data.url.contains("i.")
            }
            .map { (postData) -> Post in
                postData.data
            }
    }

    struct SubredditListingData: Decodable {
        let children: [PostData]
        
        struct PostData: Decodable {
            let data: Post
        }
    }
}
