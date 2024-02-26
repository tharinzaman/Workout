//
//  File.swift
//  
//
//  Created by Tharin Zaman on 26/02/2024.
//

import Foundation
import NetworkingDomain

final class MockNetworkClientSuccess : NetworkClient {
    func fetch<T>(from url: String, session: URLSession) async throws -> [T] where T : Decodable {
        return StaticLoader.
    }
}


