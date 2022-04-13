//
//  NetworkServiceProtocol.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.04.22.
//

import Foundation

typealias ResultHandler<T> = (Result<T, Error>) -> Void

protocol NetworkServiceProtocol: AnyObject {
    func fetch<T:Decodable>(_ url: String, completion: @escaping ResultHandler<T>)
}
