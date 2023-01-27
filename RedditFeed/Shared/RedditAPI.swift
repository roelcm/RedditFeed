//
//  Constants.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import Foundation

struct RedditAPI {
    static func subredditURL(_ subreddit: String) -> String {
        return "https://www.reddit.com/r/\(subreddit).json"
    }
    
    static func postURL(_ subreddit: String, _ postId: String) -> String {
        return "https://www.reddit.com/r/\(subreddit)/comments/\(postId)"
    }
    
    static func postJSONURL(_ subreddit: String, _ postId: String) -> String {
        return postURL(subreddit, postId + ".json")
    }

}
