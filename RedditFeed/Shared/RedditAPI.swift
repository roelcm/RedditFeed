//
//  Constants.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import Foundation

struct RedditAPI {
    static private let baseURL = "https://www.reddit.com/"
    static private let oauthURL = "https://oauth.reddit.com/"
    
    static func subredditURL(_ subreddit: String) -> String {
        return baseURL + "r/\(subreddit).json"
    }
    
    static func postURL(_ subreddit: String, _ postId: String) -> String {
        return baseURL + "r/\(subreddit)/comments/\(postId)"
    }
    
    static func postJSONURL(_ subreddit: String, _ postId: String) -> String {
        return postURL(subreddit, postId + ".json")
    }

    static func voteURL() -> String {
        oauthURL + "api/vote"
    }

}
