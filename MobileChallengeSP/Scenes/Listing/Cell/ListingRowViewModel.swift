//
//  ListingRowViewModel.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 14.04.22.
//

import Foundation

enum RowState {
    case normal
    case expanded
}

public class ListingRowViewModel {
    let id: Int
    let nodeId: String
    let name: String
    let isPrivate: Bool
    let owner: Owner
    let score: String
    var rowState: RowState = .normal
    
    init(with id: Int, nodeId:String, name: String, score: Int , isPrivate: Bool, owner: Owner) {
        self.id = id
        self.nodeId = nodeId
        self.name = name
        self.isPrivate = isPrivate
        self.owner = owner
        self.score = score.toString()
    }
    
    func toggleRowState() {
        if self.rowState == .expanded {
            rowState = .normal
        } else {
            rowState = .expanded
        }
    }
}
