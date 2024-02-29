//
//  File.swift
//  
//
//  Created by Tharin Zaman on 29/02/2024.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public struct AlertModel: Identifiable {
    
    init(
        title: String,
        message: String
    ) {
        self.title = Text(
            title
        )
        self.message = Text(
            message
        )
    }
    
    public let id = UUID()
    public let title: Text
    public let message: Text
    public let dismissButton = Alert.Button.default(
        Text(
            "OK"
        )
    )
}
