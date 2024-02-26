//
//  File.swift
//  
//
//  Created by Tharin Zaman on 26/02/2024.
//

import Foundation
import TestingUtils

@available(iOS 13.0.0, *)
final class MockFetchSuccess: FetchProtocol {
    
    private(set) var executeCalled = false
    
    func execute<T : Decodable>(from url: String, session: URLSession) async throws -> [T] {
        executeCalled = true
        return StaticLoader.loadJSONFromFileReturnDecodedData(file: "MockNetworkResponse")
    }
    
}

@available(iOS 13.0.0, *)
final class MockFetchInvalidURL: FetchProtocol {
    
    private(set) var executeCalled = false
    
    func execute<T : Decodable>(from url: String, session: URLSession) async throws -> [T] {
        executeCalled = true
        throw NetworkError.invalidURL
    }
    
}

@available(iOS 13.0.0, *)
final class MockFetchInvalidResponse: FetchProtocol {
    
    private(set) var executeCalled = false
    
    func execute<T : Decodable>(from url: String, session: URLSession) async throws -> [T] {
        executeCalled = true
        throw NetworkError.invalidResponse
    }
    
}

@available(iOS 13.0.0, *)
final class MockFetchInvalidData: FetchProtocol {
    
    private(set) var executeCalled = false
    
    func execute<T : Decodable>(from url: String, session: URLSession) async throws -> [T] {
        executeCalled = true
        throw NetworkError.invalidData
    }
    
}

