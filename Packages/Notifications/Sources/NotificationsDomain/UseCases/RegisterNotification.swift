//
//  File.swift
//  
//
//  Created by Tharin Zaman on 27/02/2024.
//

import Foundation

public protocol RegisterNotification {
    
    func execute(
        identifier: String,
        title: String,
        body: String,
        hour: Int,
        minute: Int,
        daily: Bool
    ) throws
}
