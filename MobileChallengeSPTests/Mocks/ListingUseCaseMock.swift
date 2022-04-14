//
//  ListingUseCaseMock.swift
//  ListingChallenge
//
//  Created by Waqas Naseem on 10/31/21.
//

@testable import ListingChallenge

final class ListingUseCaseMock: ListingUseCase {
    var fetchListingsResult: Result<[Listing], Error> = .failure(NetworkError.notFound)
    
    func fetchListings(then completion: @escaping Completion) {
        completion(fetchListingsResult)
    }
}
