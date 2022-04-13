//
//  ListingRowViewModel.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.04.22.
//

import Foundation

public class ListingRowViewModel {
    let id: Int
    let nodeId: String
    let name: String
    let isPrivate: Bool
    let owner: Owner
    
    init(with id: Int, nodeId:String, name: String, isPrivate: Bool, owner: Owner) {
        self.id = id
        self.nodeId = nodeId
        self.name = name
        self.isPrivate = isPrivate
        self.owner = owner
    }
}
