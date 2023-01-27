//
//  PostView.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import SwiftUI

struct PostView: View {
    let post: Post
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: post.url)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }

            PostOverlay(post: post)
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post.mockPost)
            .background(.black)
    }
}
