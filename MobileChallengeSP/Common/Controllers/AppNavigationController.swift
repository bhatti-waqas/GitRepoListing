//
//  AppNavigationController.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.4.22
//

import UIKit

final class AppNavigationController: UINavigationController {
    // MARK: - Public Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
            
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Private Methods
    private func configureUI() {
        navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.red,
             NSAttributedString.Key.font: UIFont(.avenirDemiBold, size: .standard(.h3))]
    }
}
