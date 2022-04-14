//
//  UIViewController+Extension.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.4.22
//

import UIKit

extension UIViewController {
    func presentAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        present(alert, animated: false, completion: nil)
    }
}
