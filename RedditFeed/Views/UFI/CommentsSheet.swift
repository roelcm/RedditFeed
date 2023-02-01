//
//  CommentsSheet.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import SwiftUI

struct CommentsSheet: View {
    @Environment(\.dismiss) var dismiss

    @ObservedObject var vm: ListingViewModel<PostListing>

    init(post: Post) {
        self.vm = ListingViewModel<PostListing>(url: RedditAPI.postJSONURL(post.subreddit, post.id))
    }
    
    var body: some View {
        List {
            ForEach(vm.listing?.commentListing.comments ?? [] ) { comment in
                CommentRow(comment: comment)
            }
        }
        .overlay(content: {
            if vm.isLoading {
                ProgressView()
            }
        })
        .alert("Application Error", isPresented: $vm.showAlert, actions: {
            Button("OK") {}
        }, message: {
            if let errorMessage = vm.errorMessage {
                Text(errorMessage)
            }
        })
        .listStyle(.plain)
        .task {
            await vm.fetchListing()
        }
    }
}

struct CommentsSheet_Previews: PreviewProvider {
    static var previews: some View {
        CommentsSheet(post: Post.mockPost)
    }
}
