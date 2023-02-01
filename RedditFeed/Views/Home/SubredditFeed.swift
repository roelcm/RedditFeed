//
//  SubredditFeed.swift
//  RedditFeed
//
//  Credit to Gary Tokmen for this bit of Geometry Reader code: https://blog.prototypr.io/how-to-vertical-paging-in-swiftui-f0e4afa739ba
//

import SwiftUI

struct SubredditFeed: View {
    var hiddingOverlay: Bool
    let posts: [Post]
    
    var body: some View {
        GeometryReader { proxy in
            TabView {
                ForEach(posts) { post in
                    PostView(post: post, hiddingOverlay: hiddingOverlay)
                }
                .rotationEffect(.degrees(-90)) // Rotate content
                .frame(
                    width: proxy.size.width,
                    height: proxy.size.height
                )
            }
            .frame(
                width: proxy.size.height, // Height & width swap
                height: proxy.size.width
            )
            .rotationEffect(.degrees(90), anchor: .topLeading) // Rotate TabView
            .offset(x: proxy.size.width) // Offset back into screens bounds
            .tabViewStyle(
                PageTabViewStyle(indexDisplayMode: .never)
            )
        }
    }
}

struct SubredditView_Previews: PreviewProvider {
    static var previews: some View {
        SubredditFeed(hiddingOverlay: false, posts: [Post.mockPost])
    }
}
