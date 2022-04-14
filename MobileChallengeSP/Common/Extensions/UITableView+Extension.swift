//
//  UITableView+Extension.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.04.22.
//

import UIKit

extension UITableView {
    public func dequeue<T>(for indexPath:IndexPath) -> T where T:UITableViewCell {
        // swiftlint:disable force_cast
        return self.dequeueReusableCell(withIdentifier: T.cellIdentifier, for: indexPath) as! T
    }
}
