//
//  File.swift
//  
//
//  Created by Tharin Zaman on 01/03/2024.
//

import Foundation

public struct Exercise: Decodable, Identifiable, Equatable {
    
//    public var id: UUID = UUID()
    
    public let exercise: String
    public let description: String
    public let bodyPart: String
    
    public var id: UUID {
        return UUID()
    }
    
}
