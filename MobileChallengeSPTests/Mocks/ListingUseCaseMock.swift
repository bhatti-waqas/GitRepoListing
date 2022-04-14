//
//  ListingUseCaseMock.swift
//  MobileChallengeSPTests
//
//  Created by Waqas Naseem on 13.04.22.
//

@testable import MobileChallengeSP

final class ListingUseCaseMock: ListingUseCase {
    var fetchListingsResult: Result<[Repository], Error> = .failure(NetworkError.notFound)
    
    func fetchListings(then completion: @escaping Completion) {
        completion(fetchListingsResult)
    }
}
