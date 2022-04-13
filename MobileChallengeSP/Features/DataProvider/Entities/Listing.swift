//
//  Listing.swift
//  ListingChalenge
//
//  Created by Waqas Naseem on 11/9/21.
//

import Foundation

struct Listing: Decodable {
    let name: String
    let price: String
    let uid: String
    let createdAt: String
    let imageIds: [String]
    let imageUrls: [String]
    
    enum CodingKeys: String, CodingKey {
        case name, price, uid, createdAt = "created_at", imageIds = "image_ids", imageUrls = "image_urls"
    }
}

struct ListingResponseModel: Decodable {
    let results: [Listing]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}
