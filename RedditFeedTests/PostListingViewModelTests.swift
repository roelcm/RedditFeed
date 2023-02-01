//
//  PostListingViewModelTests.swift
//  RedditFeedTests
//
//  Created by Roel Castano on 1/31/23.
//

import XCTest
@testable import RedditFeed

final class PostListingViewModelTests: XCTestCase {
    private var viewModel: ListingViewModel<PostListing>!
    private let viewService = ListingViewServiceTester()

    @MainActor override func setUp() {
        super.setUp()
        viewModel = ListingViewModel<PostListing>(
            url: RedditAPI.postURL("memes", "1234"),
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
        XCTAssertNotNil(listing?.commentListing)
        
        let commentListing = listing?.commentListing
        XCTAssertNotNil(commentListing)
        
        let comments = commentListing?.comments
        let comment = comments?.first
        XCTAssertNotNil(comment)
        print(comment)
        XCTAssertEqual(comment?.id, "j5y9wx0")
        XCTAssertEqual(comment?.body, "Pirates of the carribean in the background starts playing")
        XCTAssertEqual(comment?.author, "Gytlap24")
    }
}
