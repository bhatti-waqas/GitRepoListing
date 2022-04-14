//
//  AppServiceLocator.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.4.22
//

import Foundation
import UIKit

let serviceLocator = AppServiceLocator.shared

/// AppServiceLocator` is responsible to create/manage all dependencies of the application.
final class AppServiceLocator {
    // swiftlint: disable trailing_whitespace
    // MARK: - Class Property
    static let shared = AppServiceLocator()
    
    // MARK: - private Property
    private let listingUseCase: ListingUseCase
    
    // MARK: Init
    private init() {
        // Register dependencies
        let networkService: NetworkServiceProtocol = NetworkService()
        listingUseCase = NetworkListingUseCase(networkService: networkService)
    }
    
    func listingViewControllersFactory() -> ListingViewControllersFactory {
        return ListingViewControllersFactory(listingUseCase: listingUseCase)
    }
}
