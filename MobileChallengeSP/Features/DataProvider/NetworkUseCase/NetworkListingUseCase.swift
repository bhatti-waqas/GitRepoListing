//
//  NetworkListingUseCase.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.04.22.
//

import Foundation

final class NetworkListingUseCase {
    // MARK:- Private Properties
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}
//MARK:- NetworkListing Use case implementation
extension NetworkListingUseCase: ListingUseCase {
    
    func fetchListings(then completion: @escaping Completion) {
        networkService.fetch(APIURLs.respositoriesUrl) { (response:Result<RespositoryResponseModel,Error>) in
            switch response {
            case .success(let responseModel):
                completion(.success(responseModel.items))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
