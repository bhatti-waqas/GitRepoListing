//
//  AppNavigationController.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.4.22
//

import Foundation
import UIKit

final class ListingViewControllersFactory {
    // MARK: - Private Properties
    private let listingUseCase: ListingUseCase
    
    // MARK: - Init
    init(listingUseCase: ListingUseCase) {
        self.listingUseCase = listingUseCase
    }
    
    // MARK: - Public Methods
    func makeListingViewController(navigator: ListingCoordinator) -> ListingViewController {
        let storyboard = UIStoryboard(name: .listing)
        let viewModel = ListingViewModel(with: listingUseCase, navigator: navigator)
        let viewController = storyboard.instantiateInitialViewController {
            ListingViewController(coder: $0, viewModel: viewModel)
        }
        guard let listViewController = viewController else {
            fatalError("Failed to load ListingViewController from storyboard.")
        }
        return listViewController
    }
    
    func makeListingErrorViewController(navigator: ListingCoordinator) -> ListingErrorViewController {
        let storyboard = UIStoryboard(name: .listingError)
        let viewController = storyboard.instantiateInitialViewController() as? ListingErrorViewController
        guard let errorViewController = viewController else {
            fatalError("Failed to load ListingErrorViewController from storyboard.")
        }
        return errorViewController
    }
}
