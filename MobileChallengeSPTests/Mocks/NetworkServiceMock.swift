//
//  NetworkServiceMock.swift
//  MobileChallengeSPTests
//
//  Created by Waqas Naseem on 14.4.22.
//

@testable import MobileChallengeSP

final class NetworkServiceMock: NetworkServiceProtocol {
    var responses = [String: Any]()
    
    func fetch<T>(_ url: String, completion: @escaping ResultHandler<T>) where T: Decodable {
        if let response = responses[url] as? T {
            completion(.success(response))
        } else if let error = responses[url] as? NetworkError {
            completion(.failure(error))
        } else {
            completion(.failure(NetworkError.notFound))
        }
    }
}
