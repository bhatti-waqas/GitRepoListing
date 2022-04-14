//
//  ListingNavigatorMock.swift
//  ListingChallenge
//
//  Created by Waqas Naseem on 10/31/21.
//

@testable import ListingChallenge

final class ListingNavigatorMock: ListingNavigator {
    private(set) var showListingDidCall = false
    
    func showListDetail(with viewModel: ListingRowViewModel) {
        showListingDidCall = true
    }
}
