//
//  File.swift
//  
//
//  Created by Tharin Zaman on 26/02/2024.
//

import Foundation

@available(iOS 13.0.0, *)
public final class MockFetchSuccess: Fetch {
    
    public init() {}
    
    public private(set) var executeCalled = false
    
    public func execute<T : Decodable>(from url: String, session: URLSession) async throws -> [T] {
        executeCalled = true
        return StaticLoader.loadJSONFromFileReturnDecodedData()
    }
    
}

@available(iOS 13.0.0, *)
public final class MockFetchInvalidURL: Fetch {
    
    public init() {}
    
    public private(set) var executeCalled = false

    public func execute<T : Decodable>(from url: String, session: URLSession) async throws -> [T] {
        executeCalled = true
        throw NetworkError.invalidURL
    }
    
}

@available(iOS 13.0.0, *)
public final class MockFetchInvalidResponse: Fetch {
    
    public init() {}
    
    public private(set) var executeCalled = false

    public func execute<T : Decodable>(from url: String, session: URLSession) async throws -> [T] {
        executeCalled = true
        throw NetworkError.invalidResponse
    }
    
}

@available(iOS 13.0.0, *)
public final class MockFetchInvalidData: Fetch {
    
    public init() {}
    
    public private(set) var executeCalled = false

    public func execute<T : Decodable>(from url: String, session: URLSession) async throws -> [T] {
        executeCalled = true
        throw NetworkError.invalidData
    }
    
}

