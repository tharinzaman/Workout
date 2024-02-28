//
//  File.swift
//  
//
//  Created by Tharin Zaman on 26/02/2024.
//

import Foundation
import NetworkingDomain
import TestingUtils

@available(iOS 13.0.0, *)
final class MockNetworkClientSuccess : NetworkClient {
    
    private(set) var fetchCalled = false
    
    func fetch<T>(from url: String, session: URLSession) async throws -> [T] where T : Decodable {
        fetchCalled = true
        return StaticLoader.loadJSONFromFileReturnDecodedData(file: "MockNetworkResponse")
    }
}

@available(iOS 13.0.0, *)
final class MockNetworkClientInvalidURL : NetworkClient {
    
    private(set) var fetchCalled = false

    func fetch<T>(from url: String, session: URLSession) async throws -> [T] where T : Decodable {
        fetchCalled = true
        throw NetworkError.invalidURL
    }
}

@available(iOS 13.0.0, *)
final class MockNetworkClientInvalidResponse : NetworkClient {
    
    private(set) var fetchCalled = false

    func fetch<T>(from url: String, session: URLSession) async throws -> [T] where T : Decodable {
        fetchCalled = true
        throw NetworkError.invalidResponse
    }
}

@available(iOS 13.0.0, *)
final class MockNetworkClientInvalidData : NetworkClient {
    
    private(set) var fetchCalled = false

    func fetch<T>(from url: String, session: URLSession) async throws -> [T] where T : Decodable {
        fetchCalled = true
        throw NetworkError.invalidData
    }
}


