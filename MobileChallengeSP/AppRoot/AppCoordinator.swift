//
//  AppCoordinator.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.4.22
//

import UIKit

/// `AppCoordinator` is responsible to manage transition at windows level.
final class AppCoordinator: BaseCoordinator<AppNavigationController> {
    // MARK:- Private Properties
    private let window: UIWindow
    
    // MARK:- Init
    init(window: UIWindow) {
        self.window = window
        super.init(rootViewController: .init())
    }
    
    // MARK:- Public Methods
    override func start() {
        let coordinator = ListingCoordinator(rootViewController: rootViewController)
        startChild(coordinator)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
