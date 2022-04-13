//
//  ListingViewModelDelegate.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.4.22
//

import Foundation

public protocol ListingViewModelDelegate : AnyObject {
    func onViewModelReady()
    func onViewModelError(with error: Error)
}

protocol ListingNavigator: AnyObject {
    func showListDetail(with viewModel: ListingRowViewModel)
}
