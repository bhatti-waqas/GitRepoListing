//
//  ListingUseCase.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.04.22.
//

import Foundation

protocol ListingUseCase {
    typealias Completion = (Result<[Repository], Error>) -> Void
    
    /// it will fetch Listings.
    /// - Parameter completion: block triggered when fetching is completed.
    func fetchListings(then completion: @escaping Completion)
}
