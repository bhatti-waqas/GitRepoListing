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
    
    func test_fetchRepositoriesSucceeds() {
        // Given
        var result: Result<[Repository], Error>!
        let expectation = self.expectation(description: "Trendings")
        let repositories = getMockListingResponse()
        networkService.responses[APIURLs.respositoriesUrl] = repositories
        // when
        useCase.fetchListings(then: { value in
            result = value
            expectation.fulfill()
        })
        
        // Then
        self.waitForExpectations(timeout: 2.0, handler: nil)
        guard case .success = result else {
            XCTFail("Couldn't fetch trending repos.")
            return
        }
    }
    
    func test_fetchRepositoriesFails_onNetworkError() {
        // Given
        var result: Result<[Repository], Error>!
        let expectation = self.expectation(description: "Trendings")
        networkService.responses[APIURLs.respositoriesUrl] = NetworkError.notFound

        // when
        useCase.fetchListings(then: { value in
            result = value
            expectation.fulfill()
        })
        // Then
        self.waitForExpectations(timeout: 2.0, handler: nil)
        guard case .failure = result! else {
            XCTFail("Test didn't have failing state")
            return
        }
    }
    
    override func tearDown() {
        useCase = nil
        super.tearDown()
    }
}
// MARK: MockResponseBuilder
extension ListingUseCaseTests {
    private func getMockListingResponse() -> RespositoryResponseModel {
        do {
            let path = Bundle(for: ListingUseCaseTests.self).path(forResource: "Repositories", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONDecoder().decode(RespositoryResponseModel.self, from: data)
        } catch {
            fatalError("Error: \(error)")
        }
    }
}
