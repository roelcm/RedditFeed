//
//  SubredditViewModel.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import Foundation

class ListingViewModel<T: Decodable>: ObservableObject {
    let listingViewService: ListingViewServiceProtocol
    var urlString: String

    init(url: String, listingViewService: ListingViewServiceProtocol = ListingViewService() ) {
        self.listingViewService = listingViewService
        self.urlString = url
    }

    @Published var listing: T? = nil
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    @MainActor
    func fetchListing() async {
        isLoading.toggle()
        defer {
            isLoading.toggle()
        }
        do {
            guard let url = URL(string: urlString) else {
                throw APIError.invalidURL
            }
            listing = try await self.listingViewService.fetchRequest(url: url)
        } catch {
            showAlert = true
            errorMessage = error.localizedDescription + "\nPlease contant the developer and provide this error and the steps to reproduce"
        }
    }
    
}
