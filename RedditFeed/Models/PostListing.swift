//
//  PostListing.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/31/23.
//

import Foundation

/// Reddit listing for post comments
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
