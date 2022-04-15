//
//  ListingCoordinator.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.4.22
//

import UIKit
import UIComponents
import Coordinator

final class ListingCoordinator: BaseCoordinator<AppNavigationController> {
    
    override func start() {
        let factory = serviceLocator.listingViewControllersFactory()
        let listingViewController = factory.makeListingViewController(navigator: self)
        rootViewController.pushViewController(listingViewController, animated: true)
    }
}

extension ListingCoordinator: ListingNavigator {
    
    func showErrorState() {
        let factory = serviceLocator.listingViewControllersFactory()
        let listingErrorViewController = factory.makeListingErrorViewController(navigator: self)
        listingErrorViewController.modalPresentationStyle = .fullScreen
        rootViewController.present(listingErrorViewController, animated: true)
    }
}
