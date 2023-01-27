//
//  HomeView.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = ListingViewModel<SubredditListing>(
        url: RedditAPI.subredditURL("memes")
    )

    var body: some View {
        // Credit to Gary Tokmen for this bit of Geometry Reader code: https://blog.prototypr.io/how-to-vertical-paging-in-swiftui-f0e4afa739ba
        GeometryReader { proxy in
            TabView {
                ForEach(vm.listing?.posts ?? []) { post in
                    PostView(post: post)
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
