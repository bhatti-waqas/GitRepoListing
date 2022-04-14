//
//  Repository.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.04.22.
//

import Foundation

struct Repository: Decodable {
    let id: Int
    let nodeId: String
    let name: String
    let isPrivate: Bool
    let owner: Owner
    let score: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, owner, score, nodeId = "node_id", isPrivate = "private"
    }
}

struct Owner: Decodable {
    let login: String
    let id: Int
    let nodeId: String
    let avatarUrl: String
    enum CodingKeys: String, CodingKey {
        case login, id, nodeId = "node_id", avatarUrl = "avatar_url"
    }
}

struct RespositoryResponseModel: Decodable {
    let items: [Repository]
    enum CodingKeys: String, CodingKey {
        case items
    }
}
