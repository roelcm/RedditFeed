//
//  UFITower.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import SwiftUI

struct UFITower: View {
    @State private var showingComments = false
    @State private var showingShareSheet = false
    let post: Post

    var body: some View {
        VStack(spacing: 20) {
            UFIButton(buttonVM: UFIButtonViewModel(
                sfImage: "hand.thumbsup.fill",
                subtitle: "\(post.ups)",
                action: {
                    // TODO: liking action
                }
            ))
            UFIButton(buttonVM: UFIButtonViewModel(
                sfImage: "text.bubble.fill",
                subtitle: "\(post.num_comments)",
                action: {
                    showingComments.toggle()
                }
            ))
            UFIButton(buttonVM: UFIButtonViewModel(
                sfImage: "square.and.arrow.up.circle.fill",
                subtitle: "Share",
                action: {
                    showingShareSheet.toggle()
                }
            ))
        }
        .sheet(isPresented: $showingComments) {
            CommentsSheet(post: post)
        }
        .sheet(isPresented: $showingShareSheet) {
            ShareSheetViewController(
                itemsToShare: [RedditAPI.postURL(post.subreddit, post.id)]
            )
        }

    }
}

struct UFITower_Previews: PreviewProvider {
    static var previews: some View {
        UFITower(post: Post.mockPost)
    }
}
