//
//  ListingErrorViewController.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 14.04.22.
//

import UIKit
import Lottie
class ListingErrorViewController: UIViewController {
    
    @IBOutlet private weak var retryButton: UIButton!
    @IBOutlet weak var animationView: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        retryButton.addTarget(self, action: #selector(onRetry), for: .touchUpInside)
        configureAnimation()
    }
    
    private func configureAnimation() {
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
    }
    
    @objc private func onRetry() {
        dismiss(animated: true)
    }
}
