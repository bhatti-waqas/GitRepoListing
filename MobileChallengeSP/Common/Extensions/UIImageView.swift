//
//  UIImageView.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.04.22.
//

import UIKit
import SDWebImage

extension UIImageView {
  func setImage(with url: URL?) {
    backgroundColor = .black
    if let imageURL = url {
      sd_setImage(with: imageURL,
                  placeholderImage: UIImage(named: "placeHolder"),
                  options: [.scaleDownLargeImages], completed: nil)
    } else {
      image = UIImage(named: "placeHolder")
    }
    layer.cornerRadius = 8.0
    layer.masksToBounds = true
  }
}
