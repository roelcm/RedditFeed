//
//  ContentView.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import SwiftUI

struct ContentView: View {
    #warning("Use only for testing")
    @StateObject var vm = SubredditListingViewModel(forPreview: true)

    var body: some View {
        List {
            ForEach(vm.listing?.posts ?? []) { post in
                Text(post.title)
                    .font(.title)
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
//        Enable for network requests
//        .task {
//            await vm.fetchListing()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
