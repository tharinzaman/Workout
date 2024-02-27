//
//  StaticLoader.swift
//  MapAppTests
//
//  Created by Tharin Zaman on 21/02/2024.
//

import Foundation

public struct StaticLoader {
    
    public static func loadJSONFromFileReturnData(
        file: String
    ) -> Data? {
        guard let path = Bundle.main.path(
            forResource: "MockNetworkResponse",
            ofType: "json"
        ) else {
            fatalError("Invalid path")
        }
        guard let data = FileManager.default.contents(
            atPath: path
        ) else {
            fatalError("No data for path")
        }
        return data
    }
    
    public static func loadJSONFromFileReturnDecodedData<T:Decodable>(
        file: String
    ) -> [T] {
        
        guard let path = Bundle.main.path(
            forResource: file,
            ofType: "json"
        ) else {
            fatalError("Invalid path")
        }
        
        guard let data = FileManager.default.contents(
            atPath: path
        ) else {
            fatalError("No data for path")
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
