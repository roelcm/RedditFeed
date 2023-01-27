//
//  PostOverlay.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import SwiftUI

struct PostOverlay: View {
    let post: Post

    var body: some View {
        ZStack {
            gradient
            VStack {
                Spacer()
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("r/" + post.subreddit)
                            .bold()
                            .font(.title3)
                        Text(post.title)
                            .lineLimit(2)
                    }
                    Spacer()
                    UFITower()
                }
                .foregroundColor(.white)
                .padding()
            }
        }
    }
    
    var gradient: LinearGradient {
        // Gradient can by improved by only taking the space of the overlay
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
}

struct PostOverlay_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post.mockPost)
    }
}
