//
//  File.swift
//  
//
//  Created by Tharin Zaman on 26/02/2024.
//

import Foundation
import NetworkingDomain

@available(iOS 13.0.0, *)
internal struct NetworkClientImpl: NetworkClient {
    
    func fetch<T : Decodable>(from url: String, session: URLSession) async throws -> [T] {
        
        guard let url = URL(
            string: url
        ) else {
            throw NetworkError.invalidURL
        }
        
        let (
            data,
            response
        ) = try await session.data(
            from: url
        )
        
        guard (
            response as? HTTPURLResponse
        )?.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(
                [T].self,
                from: data
            )
        } catch {
            throw NetworkError.invalidData
        }
    }
    
}
