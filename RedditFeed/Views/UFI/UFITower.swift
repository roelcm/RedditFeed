//
//  UFITower.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import SwiftUI

struct UFITower: View {
    @EnvironmentObject var session: Session
    @State private var showingComments = false
    @State private var showingShareSheet = false
    let post: Post
    @State var liked = false

    var body: some View {
        VStack(spacing: 20) {
            UFIButton(buttonVM: UFIButtonViewModel(
                sfImage: "hand.thumbsup.fill",
                subtitle: "\(post.ups)",
                action: {
                    session.vote(.post, liked ? .up : .none, name: post.id) { result in
                        switch result {
                        case .success(let _):
                            liked.toggle()
                        case .failure(let error):
                            // TODO: Handle Error
                            print(error)
                        }
                    }
                }
            ))
            .foregroundColor(liked ? .blue : .white)

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
