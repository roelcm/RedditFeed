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
        return data.children.map { (postData) -> Post in
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

struct Empty: Decodable { }

extension UnkeyedDecodingContainer {
  public mutating func skip() throws {
    _ = try decode(Empty.self)
  }
}

struct PostListing: Decodable {
    let commentListing: CommentListing
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        /// Skip the first container which represents the post.
        _ = try container.skip()
        self.commentListing = try container.decode(CommentListing.self)
    }
    
    struct CommentListing: Decodable {
        let kind: String
        let data: CommentListingData

        var comments: [Comment] {
            return data.children.map { (commentData) -> Comment in
                return commentData.data
            }
        }

        struct CommentListingData: Decodable {
            let children: [CommentData]
            enum CodingKeys: String, CodingKey {
                case children
            }

            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                let collection = try container.decode(
                    LossyCodableList<CommentData>.self,
                    forKey: .children
                )
                
                children = collection.elements
            }

            struct CommentData: Decodable {
                let data: Comment
            }
        }
    }

}
