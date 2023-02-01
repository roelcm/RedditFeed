//
//  ListingViewModelTests.swift
//  RedditFeedTests
//
//  Created by Roel Castano on 1/31/23.
//

import XCTest
@testable import RedditFeed

final class SubredditListingViewModelTests: XCTestCase {
    private var viewModel: ListingViewModel<SubredditListing>!
    private let viewService = ListingViewServiceTester()

    @MainActor override func setUp() {
        super.setUp()
        viewModel = ListingViewModel<SubredditListing>(
            url: RedditAPI.subredditURL("memes"),
            listingViewService: viewService
        )
    }

    func test_listingViewModel_isLoading() throws {
        let isLoading = viewModel.isLoading
        
        XCTAssertEqual(isLoading, false)
    }
    
    func test_listingViewModel_showAlert() throws {
        let showAlert = viewModel.showAlert
        
        XCTAssertEqual(showAlert, false)
    }

    func test_listingViewModel_emptyListing() throws {
        let listing = viewModel.listing
        
        XCTAssertNil(listing)
    }

    func test_listingViewModel_emptyError() throws {
        let listing = viewModel.listing
        
        XCTAssertNil(listing)
    }
    
    func test_listingViewModel_fetchListing() async {
        await viewModel.fetchListing()
        let listing = viewModel.listing

        XCTAssertNotNil(listing)
        XCTAssertNotNil(listing?.posts)
        
        let post = listing?.posts.first
        XCTAssertEqual(post?.id, "10lnubs")
        XCTAssertEqual(post?.title, "I have to eat and got bills to pay")
        XCTAssertEqual(post?.author, "Killmumger")
    }
}
