//
//  PostView.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import SwiftUI

struct PostView: View {
    var post: Post
    var body: some View {
        AsyncImage(url: URL(string: post.url)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post.mockPost)
    }
}
