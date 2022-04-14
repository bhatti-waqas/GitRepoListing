//
//  ListingViewControllersFactory.swift
//  ListingChallenge
//
//  Created by Waqas Naseem on 11/9/21.
//

import Foundation
import UIKit

final class ListingViewControllersFactory {
    // MARK:- Private Properties
    private let listingUseCase: ListingUseCase
    
    // MARK:- Init
    init(listingUseCase: ListingUseCase) {
        self.listingUseCase = listingUseCase
    }
    
    // MARK:- Public Methods
    func makeListingViewController(navigator: ListingCoordinator) -> ListingViewController_v1 {
        let storyboard = UIStoryboard(name: .listing)
        let viewModel = ListingViewModel(with: listingUseCase, navigator: navigator)
        let viewController = storyboard.instantiateInitialViewController {
            ListingViewController_v1(coder: $0, viewModel: viewModel)
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
            fatalError("Failed to load ListingDetailViewController from storyboard.")
        }
        return errorViewController
    }
}
