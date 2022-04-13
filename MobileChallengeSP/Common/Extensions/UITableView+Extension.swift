//
//  UITableView+Extension.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 11/9/21.
//

import UIKit

extension UITableView {
    public func dequeue<T>(for indexPath:IndexPath)->T where T:UITableViewCell{
        return self.dequeueReusableCell(withIdentifier: T.cellIdentifier, for: indexPath) as! T
    }
}
