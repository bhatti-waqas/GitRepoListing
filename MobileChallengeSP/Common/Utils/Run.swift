//
//  Run.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.4.22.
//

import Foundation

final class Run {
    
    public class func onMainThread(after delay:Double = 0, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
}
