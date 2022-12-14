//
//  UITableView+Extension.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.04.22.
//

import UIKit

public extension UITableView {
    
    func dequeue<T>(for indexPath: IndexPath) -> T where T: UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: T.cellIdentifier, for: indexPath) as! T
    }
}
