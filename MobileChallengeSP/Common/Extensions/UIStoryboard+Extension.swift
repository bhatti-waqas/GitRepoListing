//
//  UIStoryboard+Extension.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.04.22.
//

import UIKit

extension UIStoryboard {
    enum Name: String {
        case listing = "Listing"
        case listingError = "ListingError"
    }
    convenience init(name: Name, bundle: Bundle? = nil) {
        self.init(name: name.rawValue, bundle: bundle)
    }
}
