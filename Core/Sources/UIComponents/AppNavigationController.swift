//
//  AppNavigationController.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.4.22
//

import UIKit

final public class AppNavigationController: UINavigationController {
    // MARK: - Public Methods
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
            
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Private Methods
    private func configureUI() {
        navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
//        navigationBar.titleTextAttributes =
//            [NSAttributedString.Key.foregroundColor: getForeGroundColorForNavigationTitle(),
//             NSAttributedString.Key.font: UIFont(.avenirDemiBold, size: .standard(.h3))]
    }
    
    private func getForeGroundColorForNavigationTitle() -> UIColor {
        return UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor.white
            default:
                return UIColor.black
            }
        }
    }
}
