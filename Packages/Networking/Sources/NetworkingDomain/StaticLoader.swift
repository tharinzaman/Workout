//
//  StaticLoader.swift
//  MapAppTests
//
//  Created by Tharin Zaman on 21/02/2024.
//

import Foundation

public struct StaticLoader {
    
    public static func loadJSONFromFileReturnData() -> Data? {
        guard let url = Bundle.module.url(
            forResource: "MockNetworkResponse",
            withExtension: "json",
            subdirectory: "TestingUtils"
        ) else {
            fatalError("Invalid path")
        }
        var data: Data? = nil
        do {
            data = try Data(contentsOf: url)
        } catch {
            fatalError("No data due to: \(error.localizedDescription)")
        }
        return data
    }
    
    public static func loadJSONFromFileReturnDecodedData<T:Decodable>() -> [T] {
        guard let url = Bundle.module.url(
            forResource: "MockNetworkResponse",
            withExtension: "json",
            subdirectory: "TestingUtils"
        ) else {
            fatalError("Invalid path")
        }
        var data: Data? = nil
        do {
            data = try Data(contentsOf: url)
        } catch {
            fatalError("No data due to: \(error.localizedDescription)")
        }
        guard let data else {
            fatalError("Data is nil")
        }
        do {
            return try JSONDecoder().decode(
                [T].self,
                from: data
            )
        } catch {
            fatalError("Invalid data")
        }
    }
    
}
