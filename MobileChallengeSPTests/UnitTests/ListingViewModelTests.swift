//
//  ListingUseCaseTests.swift
//  MobileChallengeSPTests
//
//  Created by Waqas Naseem on 14.4.22.
//
import XCTest
@testable import MobileChallengeSP

final class ListingViewModelTests: XCTestCase {
    
    private let navigator = ListingNavigatorMock()
    private var isReadyStateTriggered: Bool = false
    private var isErrorStateTriggered: Bool = false
    private let errorStateExpectation = XCTestExpectation(description: "Should have error Sate")
    private let readyStateExpectation = XCTestExpectation(description: "Should have ready Sate")
    
    func test_when_fetchingFailed_shouldHaveError() {
        //1. given
        let useCase = ListingUseCaseMock()
        let viewModel = ListingViewModel(with: useCase, navigator: navigator)
        viewModel.delegate = self
        
        //2. when
        viewModel.load()
        
        //waitForExpectations(timeout: 1.0, handler: nil)
        wait(for: [errorStateExpectation], timeout: 1.0)
        //3. then
        XCTAssertTrue(isErrorStateTriggered, "Should trigger error state")
    }
    
    func test_when_fetchingSuccessful_shouldHaveReadyState() {
        //1. given
        let useCase = ListingUseCaseMock()
        let listingResponse = getMockListingResponse()
        useCase.fetchListingsResult = .success(listingResponse.results)
        let viewModel = ListingViewModel(with: useCase, navigator: navigator)
        viewModel.delegate = self
        
        //2. when
        viewModel.load()
        
        wait(for: [readyStateExpectation], timeout: 1.0)
        //3. then
        XCTAssertTrue(isReadyStateTriggered, "Should trigger ready state")
    }
    
    override func tearDown() {
        isReadyStateTriggered = false
        isErrorStateTriggered = false
        super.tearDown()
    }
}
//MARK: ViewModel Delegates
extension ListingViewModelTests: ListingViewModelDelegate {
    func onViewModelReady() {
        isReadyStateTriggered = true
        readyStateExpectation.fulfill()
    }
    
    func onViewModelError(with error: Error) {
        isErrorStateTriggered = true
        errorStateExpectation.fulfill()
    }
}

//MARK: MockResponseBuilder
extension ListingViewModelTests {
    private func getMockListingResponse() -> ListingResponseModel {
        do {
            let path = Bundle(for: ListingViewModelTests.self).path(forResource: "Listings", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONDecoder().decode(ListingResponseModel.self, from: data)
        } catch {
            fatalError("Error: \(error)")
        }
    }
}
