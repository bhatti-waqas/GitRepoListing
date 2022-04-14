//
//  ListingErrorViewController.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 14.04.22.
//

import UIKit

class ListingErrorViewController: UIViewController {

    @IBOutlet private weak var retryButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        retryButton.addTarget(self, action: #selector(onRetry), for: .touchUpInside)
    }
    
    @objc private func onRetry() {
        dismiss(animated: true)
    }
}
