//
//  SubredditViewModel.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import Foundation

class SubredditListingViewModel: ObservableObject {
    @Published var listing: SubredditListing? = nil
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    @MainActor
    func fetchListing() async {
        print("help")
        let urlString = RedditAPI.subredditURL("memes")
        let listingAPIService = APIService(urlString: urlString)
        isLoading.toggle()
        defer {
            isLoading.toggle()
        }
        do {
            listing = try await listingAPIService.getJSON()
        } catch {
            print(error.localizedDescription)
            showAlert = true
            errorMessage = error.localizedDescription + "\nPlease contant the developer and provide this error and the steps to reproduce"
        }
    }
    
}

extension SubredditListingViewModel {
    convenience init(forPreview: Bool = false) {
        self.init()
        if forPreview {
            self.listing = SubredditListing.mockListing
        }
    }
}
