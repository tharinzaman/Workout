//
//  File.swift
//
//
//  Created by Tharin Zaman on 26/02/2024.
//

import Foundation
import NetworkingDomain

@available(iOS 13.0.0, *)
internal class FetchImpl: Fetch {
    
    private let client: NetworkClient
    
    init(
        client: NetworkClient
    ) {
        self.client = client
    }
    
    func execute<T:Decodable>(
        from url: String,
        session: URLSession
    ) async throws -> [T] {
        return try await client.fetch(from: url, session: session)
    }
}
