//
//  HomeView.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import SwiftUI
import OAuthSwift

struct HomeView: View {
    @State private var selectedSubreddit = "memes"
    @State var hiddingOverlay = false
    @GestureState var press = false
    @EnvironmentObject var session: Session

    @StateObject var vm = ListingViewModel<SubredditListing>(
        url: RedditAPI.subredditURL("memes")
    )

    var body: some View {
        ZStack {
            SubredditFeed(hiddingOverlay: hiddingOverlay, posts: vm.listing?.posts ?? [])
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
            
            HomeOverlay(selectedSubreddit: $selectedSubreddit, hiddingOverlay: $hiddingOverlay)
            .onChange(of: selectedSubreddit, perform: { subreddit in
                Task {
                    await self.updateSubreddit(subreddit: subreddit)
                }
            })
        }
    }
}

extension HomeView {
    
    func updateSubreddit(subreddit: String) async {
        vm.urlString = RedditAPI.subredditURL(subreddit)
        await vm.fetchListing()
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .background(.black)
    }
}
