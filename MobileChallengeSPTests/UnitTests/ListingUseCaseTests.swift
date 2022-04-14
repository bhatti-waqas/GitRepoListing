//
//  ListingUseCaseTests.swift
//  MobileChallengeSPTests
//
//  Created by Waqas Naseem on 14.4.22.
//

import XCTest
@testable import MobileChallengeSP

final class ListingUseCaseTests: XCTestCase {
    private let networkService = NetworkServiceMock()
    private var useCase: ListingUseCase!
    
    override func setUp() {
        useCase = NetworkListingUseCase(networkService: networkService)
    }
    
    func test_fetchListingssSucceeds() {
        // Given
        var result: Result<[Listing], Error>!
        let expectation = self.expectation(description: "Listings")
        let listings = getMockListingResponse()
        networkService.responses[APIURLs.listingUrl] = listings
        //when
        useCase.fetchListings(then: { value in
            result = value
            expectation.fulfill()
        })
        
        // Then
        self.waitForExpectations(timeout: 2.0, handler: nil)
        guard case .success = result else {
            XCTFail()
            return
        }
    }
    
    func test_fetchListingsFails_onNetworkError() {
        // Given
        var result: Result<[Listing], Error>!
        let expectation = self.expectation(description: "Listings")
        networkService.responses[APIURLs.listingUrl] = NetworkError.notFound

        //when
        useCase.fetchListings(then: { value in
            result = value
            expectation.fulfill()
        })
        // Then
        self.waitForExpectations(timeout: 2.0, handler: nil)
        guard case .failure = result! else {
            XCTFail()
            return
        }
    }
    
    override func tearDown() {
        useCase = nil
        super.tearDown()
    }
}
//MARK: MockResponseBuilder
extension ListingUseCaseTests {
    private func getMockListingResponse() -> ListingResponseModel {
        do {
            let path = Bundle(for: ListingUseCaseTests.self).path(forResource: "Listings", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONDecoder().decode(ListingResponseModel.self, from: data)
        } catch {
            fatalError("Error: \(error)")
        }
    }
}
