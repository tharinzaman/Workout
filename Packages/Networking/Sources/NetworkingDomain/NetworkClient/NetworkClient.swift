//
//  File.swift
//
//
//  Created by Tharin Zaman on 26/02/2024.
//

import Foundation

@available(iOS 13.0.0,*)
public protocol NetworkClient {
    
    func fetch<T: Decodable>(
        from url: String,
        session: URLSession
    ) async throws -> [T]
    
}
