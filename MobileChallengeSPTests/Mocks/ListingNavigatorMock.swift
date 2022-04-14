//
//  ListingNavigatorMock.swift
//  MobileChallengeSPTests
//
//  Created by Waqas Naseem on 10/31/21.
//

@testable import MobileChallengeSP

final class ListingNavigatorMock: ListingNavigator {
    func showErrorState() {
        showErrorStateDidCall = true
    }
    
    private(set) var showListingDidCall = false
    private(set) var showErrorStateDidCall = false
    
    func showListDetail(with viewModel: ListingRowViewModel) {
        showListingDidCall = true
    }
}
