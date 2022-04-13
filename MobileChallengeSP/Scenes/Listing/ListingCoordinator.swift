//
//  ListingCoordinator.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 11/9/21.
//

import UIKit

final class ListingCoordinator: BaseCoordinator<AppNavigationController> {
    
    override func start() {
        let factory = ServiceLocator.listingViewControllersFactory()
        let listingViewController = factory.makeListingViewController(navigator: self)
        rootViewController.pushViewController(listingViewController, animated: true)
    }
}

extension ListingCoordinator: ListingNavigator {
    func showListDetail(with viewModel: ListingRowViewModel) {
        //TO-DO
    }
}
