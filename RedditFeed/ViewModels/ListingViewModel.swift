//
//  SubredditViewModel.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import Foundation

class ListingViewModel<T: Decodable>: ObservableObject {
    let listingViewService: ListingViewService
    let urlString: String

    init(url: String) {
        self.listingViewService = ListingViewService()
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
            print(error.localizedDescription)
            showAlert = true
            errorMessage = error.localizedDescription + "\nPlease contant the developer and provide this error and the steps to reproduce"
        }
    }
    
}

//extension ListingViewModel {
//    convenience init(forPreview: Bool = false) {
////        self.init()
////        if forPreview {
////            self.listing = SubredditListing.mockListing
//        }
//    }
//}
